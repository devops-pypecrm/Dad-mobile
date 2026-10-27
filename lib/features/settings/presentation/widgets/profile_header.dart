import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/router/app_router.dart';
import '../../../auth/domain/user_session.dart';
import 'authenticated_avatar.dart';

const _brandColor = Color(0xFF9654B5);

/// Tappable profile card at the top of Settings — decorative green-blob
/// background, avatar with a ring + edit badge, name/role/tagline/
/// description. Opens the Account screen.
class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key, required this.session});

  final UserSession session;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: _brandColor.withValues(alpha: 0.05),
        child: InkWell(
          onTap: () => context.push(AppRoutes.account),
          child: Stack(
            children: [
              // Decorative organic blobs — purely background, behind
              // everything else in the stack.
              Positioned(top: -36, left: -40, child: _blob(96, 0.14)),
              Positioned(bottom: -50, left: -30, child: _blob(120, 0.10)),
              Positioned(top: -16, right: 30, child: _blob(56, 0.08)),
              Positioned(
                right: 14,
                bottom: 10,
                child: Icon(Icons.auto_awesome, size: 14, color: _brandColor.withValues(alpha: 0.55)),
              ),
              Positioned(right: 30, bottom: 22, child: _blob(5, 0.5)),
              Positioned(right: 20, bottom: 8, child: _blob(4, 0.4)),

              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 40, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(shape: BoxShape.circle, color: theme.colorScheme.surface),
                          child: AuthenticatedAvatar(
                            imageUrl: session.profileImage,
                            fallbackInitial: session.initial,
                            size: 64,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 22,
                            height: 22,
                            decoration: BoxDecoration(
                              color: _brandColor,
                              shape: BoxShape.circle,
                              border: Border.all(color: theme.colorScheme.surface, width: 2),
                            ),
                            child: const Icon(Icons.camera_alt, color: Colors.white, size: 11),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${session.firstName} ${session.lastName}',
                            style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            session.displayTitle,
                            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Build. Manage. Grow.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: _brandColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Keep your account secure and up to date.',
                            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _blob(double size, double alpha) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: _brandColor.withValues(alpha: alpha)),
    );
  }
}
