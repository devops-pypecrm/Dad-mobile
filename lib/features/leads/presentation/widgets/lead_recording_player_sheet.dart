import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

/// Generic recording playback sheet for the WhatsApp Calls / Call History
/// lead-activity tabs — same playback UI as
/// `calls/presentation/widgets/call_recording_player_sheet.dart`, but that
/// one is tied to a `CallLog` domain object; this takes a bare title/url
/// pair since these rows come from different, lighter-weight models.
Future<void> showLeadRecordingPlayer(
  BuildContext context, {
  required String title,
  required String url,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    builder: (context) => _LeadRecordingPlayerSheet(title: title, url: url),
  );
}

class _LeadRecordingPlayerSheet extends StatefulWidget {
  const _LeadRecordingPlayerSheet({required this.title, required this.url});

  final String title;
  final String url;

  @override
  State<_LeadRecordingPlayerSheet> createState() =>
      _LeadRecordingPlayerSheetState();
}

class _LeadRecordingPlayerSheetState extends State<_LeadRecordingPlayerSheet> {
  final _player = AudioPlayer();
  StreamSubscription<Duration>? _positionSub;
  StreamSubscription<Duration>? _durationSub;
  StreamSubscription<PlayerState>? _stateSub;

  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  bool _isPlaying = false;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _positionSub = _player.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );
    _durationSub = _player.onDurationChanged.listen(
      (d) => setState(() => _duration = d),
    );
    _stateSub = _player.onPlayerStateChanged.listen((state) {
      setState(() => _isPlaying = state == PlayerState.playing);
    });
    _load();
  }

  Future<void> _load() async {
    try {
      await _player.setSourceUrl(widget.url);
      await _player.resume();
    } catch (_) {
      if (mounted) setState(() => _error = 'Could not play this recording.');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _togglePlayback() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.resume();
    }
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _positionSub?.cancel();
    _durationSub?.cancel();
    _stateSub?.cancel();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurfaceVariant.withValues(
                    alpha: 0.3,
                  ),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Text(
              'Recording',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              widget.title,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 20),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  _error!,
                  style: TextStyle(color: theme.colorScheme.error),
                ),
              )
            else ...[
              Row(
                children: [
                  IconButton.filled(
                    iconSize: 36,
                    onPressed: _isLoading ? null : _togglePlayback,
                    icon: _isLoading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Slider(
                          value: _position.inMilliseconds
                              .clamp(
                                0,
                                _duration.inMilliseconds == 0
                                    ? 1
                                    : _duration.inMilliseconds,
                              )
                              .toDouble(),
                          max: _duration.inMilliseconds == 0
                              ? 1
                              : _duration.inMilliseconds.toDouble(),
                          onChanged: _duration.inMilliseconds == 0
                              ? null
                              : (value) => _player.seek(
                                  Duration(milliseconds: value.round()),
                                ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _formatDuration(_position),
                                style: theme.textTheme.labelSmall,
                              ),
                              Text(
                                _formatDuration(_duration),
                                style: theme.textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
