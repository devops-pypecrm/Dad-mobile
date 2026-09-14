import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/network/dio_provider.dart';

/// Circular profile photo, fetched through the authenticated [Dio] instance
/// — `User.profileImage` is a relative `/api/documents/:id/download` path
/// requiring the same JWT as everything else (same reason
/// `checkins/presentation/widgets/authenticated_thumbnail.dart` exists),
/// just circle-clipped instead of rounded-square, and falling back to an
/// initial letter instead of a spinner/broken-image icon while
/// loading/on error — better suited to a small always-visible avatar than
/// a large one-off thumbnail.
class AuthenticatedAvatar extends ConsumerWidget {
  const AuthenticatedAvatar({super.key, required this.imageUrl, required this.fallbackInitial, this.size = 88});

  final String? imageUrl;
  final String fallbackInitial;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = imageUrl;
    if (path == null || path.isEmpty) return _fallback(context);

    final dio = ref.watch(dioProvider);
    final url = path.startsWith('http') ? path : '${AppConfig.instance.apiOrigin}$path';

    return FutureBuilder<Response<List<int>>>(
      future: dio.getUri<List<int>>(Uri.parse(url), options: Options(responseType: ResponseType.bytes)),
      builder: (context, snapshot) {
        final bytes = snapshot.data?.data;
        if (snapshot.connectionState != ConnectionState.done || bytes == null) {
          return _fallback(context);
        }
        return CircleAvatar(
          radius: size / 2,
          backgroundImage: MemoryImage(Uint8List.fromList(bytes)),
        );
      },
    );
  }

  Widget _fallback(BuildContext context) {
    final theme = Theme.of(context);
    return CircleAvatar(
      radius: size / 2,
      backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.15),
      child: Text(
        fallbackInitial,
        style: TextStyle(fontSize: size * 0.36, fontWeight: FontWeight.bold, color: theme.colorScheme.primary),
      ),
    );
  }
}
