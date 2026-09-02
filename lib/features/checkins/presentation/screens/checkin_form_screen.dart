import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/utils/safe_bottom_padding.dart';
import '../../data/location_service.dart';
import '../../data/photo_service.dart';
import '../../domain/pending_checkin.dart';
import '../../providers/checkin_sync_controller.dart';

const _checkInTypes = ['visit', 'meeting', 'call', 'other'];

class CheckInFormScreen extends ConsumerStatefulWidget {
  const CheckInFormScreen({
    super.key,
    this.leadId,
    this.contactId,
    this.accountId,
  });

  final String? leadId;
  final String? contactId;
  final String? accountId;

  @override
  ConsumerState<CheckInFormScreen> createState() => _CheckInFormScreenState();
}

class _CheckInFormScreenState extends ConsumerState<CheckInFormScreen> {
  final _notesController = TextEditingController();
  String _type = 'visit';
  Position? _position;
  File? _photo;
  bool _isFetchingLocation = false;
  bool _isSubmitting = false;
  String? _locationError;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _requestLocation());
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _requestLocation() async {
    final proceed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location needed'),
        content: const Text(
          "We use your device's GPS to record where this check-in happened, "
          'so it shows up accurately on your activity feed.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Not now'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Allow'),
          ),
        ],
      ),
    );
    if (proceed != true || !mounted) return;

    setState(() {
      _isFetchingLocation = true;
      _locationError = null;
    });

    try {
      final position = await ref
          .read(locationServiceProvider)
          .getCurrentPosition();
      if (!mounted) return;
      setState(() {
        _position = position;
        _isFetchingLocation = false;
      });
    } on LocationServicesOffException {
      if (!mounted) return;
      setState(() {
        _isFetchingLocation = false;
        _locationError = 'Location services are turned off on this device.';
      });
    } on LocationPermissionDeniedException catch (e) {
      if (!mounted) return;
      setState(() {
        _isFetchingLocation = false;
        _locationError = e.isPermanent
            ? 'Location permission was permanently denied. Enable it from device Settings to check in.'
            : 'Location permission denied — check-in will be submitted without GPS coordinates.';
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isFetchingLocation = false;
        _locationError = "Couldn't get location: $e";
      });
    }
  }

  Future<void> _takePhoto() async {
    final file = await ref.read(photoServiceProvider).captureAndCompress();
    if (file != null && mounted) setState(() => _photo = file);
  }

  Future<void> _submit() async {
    setState(() => _isSubmitting = true);

    final draft = PendingCheckIn(
      localId: '${DateTime.now().microsecondsSinceEpoch}',
      type: _type,
      notes: _notesController.text.trim().isEmpty
          ? null
          : _notesController.text.trim(),
      leadId: widget.leadId,
      contactId: widget.contactId,
      accountId: widget.accountId,
      latitude: _position?.latitude,
      longitude: _position?.longitude,
      localPhotoPath: _photo?.path,
      capturedAt: DateTime.now(),
    );

    try {
      final outcome = await ref
          .read(checkInSyncProvider.notifier)
          .submit(draft);
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            outcome == CheckInSubmitOutcome.submitted
                ? 'Check-in submitted.'
                : "You're offline — check-in saved and will sync automatically.",
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(SnackBar(content: Text('Could not save check-in: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Check In')),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, safeBottomInset(context) + 16),
        children: [
          Text('Type', style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _checkInTypes
                .map(
                  (t) => ChoiceChip(
                    label: Text(t),
                    selected: _type == t,
                    // Default Chip padding renders well under the 48dp
                    // minimum tap target since it's the sole way to pick a type.
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                      vertical: 12,
                    ),
                    onSelected: (_) => setState(() => _type = t),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _notesController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: 'Notes',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: _isFetchingLocation
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.location_on_outlined),
              title: Text(
                _position != null
                    ? '${_position!.latitude.toStringAsFixed(5)}, ${_position!.longitude.toStringAsFixed(5)}'
                    : (_locationError ?? 'Fetching location…'),
              ),
              trailing: TextButton(
                onPressed: _requestLocation,
                child: const Text('Retry'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          if (_photo != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                _photo!,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 8),
          OutlinedButton.icon(
            onPressed: _takePhoto,
            icon: const Icon(Icons.camera_alt_outlined),
            label: Text(_photo == null ? 'Take Photo' : 'Retake Photo'),
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: _isSubmitting ? null : _submit,
            child: _isSubmitting
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2.5),
                  )
                : const Text('Submit Check-In'),
          ),
        ],
      ),
    );
  }
}
