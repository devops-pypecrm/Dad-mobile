import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/widgets/error_state_view.dart';
import '../../providers/profile_controller.dart';
import '../widgets/authenticated_avatar.dart';

const _brandColor = Color(0xFF578732);

/// "Account" — photo, name, phone, position/title, plus a read-only email
/// (email changes aren't supported; `profileController.ts`'s `updateProfile`
/// explicitly strips it server-side even if sent). Everything here writes
/// through `PUT /api/profile`, which already accepted these fields — this
/// screen is the first UI (mobile or web) to actually expose editing them.
class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends ConsumerState<AccountScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _positionController = TextEditingController();

  bool _loadedInitialValues = false;
  bool _isSaving = false;
  bool _isUploadingPhoto = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 85);
    if (picked == null || !mounted) return;

    setState(() => _isUploadingPhoto = true);
    try {
      await ref.read(profileControllerProvider.notifier).uploadAndSetPhoto(File(picked.path));
      if (!mounted) return;
      showAppSnackBar(context, 'Profile photo updated');
    } catch (e) {
      if (!mounted) return;
      showAppSnackBar(context, 'Failed to update photo: $e', isError: true);
    } finally {
      if (mounted) setState(() => _isUploadingPhoto = false);
    }
  }

  Future<void> _save() async {
    setState(() => _isSaving = true);
    try {
      await ref.read(profileControllerProvider.notifier).updateDetails(
            firstName: _firstNameController.text.trim(),
            lastName: _lastNameController.text.trim(),
            phone: _phoneController.text.trim(),
            position: _positionController.text.trim(),
          );
      if (!mounted) return;
      showAppSnackBar(context, 'Account updated');
    } catch (e) {
      if (!mounted) return;
      showAppSnackBar(context, 'Failed to save: $e', isError: true);
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(profileControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Account')),
      body: profileAsync.when(
        data: (profile) {
          if (!_loadedInitialValues) {
            _firstNameController.text = profile.firstName;
            _lastNameController.text = profile.lastName;
            _phoneController.text = profile.phone ?? '';
            _positionController.text = profile.position ?? '';
            _loadedInitialValues = true;
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: Stack(
                  children: [
                    AuthenticatedAvatar(imageUrl: profile.profileImage, fallbackInitial: profile.firstName[0], size: 96),
                    if (_isUploadingPhoto)
                      const Positioned.fill(
                        child: CircleAvatar(
                          backgroundColor: Colors.black38,
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white),
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: _isUploadingPhoto ? null : _pickPhoto,
                        customBorder: const CircleBorder(),
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: _brandColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Theme.of(context).colorScheme.surface, width: 2),
                          ),
                          child: const Icon(Icons.camera_alt, color: Colors.white, size: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _firstNameController,
                      decoration: const InputDecoration(labelText: 'First Name'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _lastNameController,
                      decoration: const InputDecoration(labelText: 'Last Name'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: profile.email,
                enabled: false,
                decoration: const InputDecoration(labelText: 'Email', helperText: 'Email cannot be changed'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _positionController,
                decoration: const InputDecoration(labelText: 'Job Title / Position'),
              ),
              const SizedBox(height: 24),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: _brandColor, minimumSize: const Size.fromHeight(48)),
                onPressed: _isSaving ? null : _save,
                child: _isSaving
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white),
                      )
                    : const Text('Save Changes'),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => ErrorStateView(
          error: error,
          onRetry: () => ref.invalidate(profileControllerProvider),
        ),
      ),
    );
  }
}
