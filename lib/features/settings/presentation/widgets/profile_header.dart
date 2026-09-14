import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../auth/domain/user_session.dart';
import 'authenticated_avatar.dart';

const _brandColor = Color(0xFF578732);

/// Avatar + name + role, matching the reference's profile-header pattern
/// (avatar with an edit badge, name, secondary line). Tapping it opens the
/// new Account screen — same "tap your own header to edit it" convention
/// the reference uses.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.session});

  final UserSession session;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => context.push(AppRoutes.account),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Stack(
              children: [
                AuthenticatedAvatar(imageUrl: session.profileImage, fallbackInitial: session.initial, size: 88),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: _brandColor,
                      shape: BoxShape.circle,
                      border: Border.all(color: theme.colorScheme.surface, width: 2),
                    ),
                    child: const Icon(Icons.camera_alt, color: Colors.white, size: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '${session.firstName} ${session.lastName}',
              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Text(
              session.displayTitle,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}
