import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/network/dio_provider.dart';

/// `photoUrl` on a CheckIn is a relative `/api/documents/:id/download` path
/// requiring the same JWT as everything else, so a plain `Image.network`
/// won't work — this fetches bytes through the shared authenticated [Dio]
/// instance instead.
class AuthenticatedThumbnail extends ConsumerWidget {
  const AuthenticatedThumbnail({super.key, required this.path, this.size = 56});

  final String path;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dio = ref.watch(dioProvider);
    final url = path.startsWith('http') ? path : '${AppConfig.instance.apiOrigin}$path';

    return FutureBuilder<Response<List<int>>>(
      future: dio.getUri<List<int>>(Uri.parse(url), options: Options(responseType: ResponseType.bytes)),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox(
            width: size,
            height: size,
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        }
        final bytes = snapshot.data?.data;
        if (snapshot.hasError || bytes == null) {
          return SizedBox(
            width: size,
            height: size,
            child: const Icon(Icons.broken_image_outlined),
          );
        }
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.memory(
            Uint8List.fromList(bytes),
            width: size,
            height: size,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
