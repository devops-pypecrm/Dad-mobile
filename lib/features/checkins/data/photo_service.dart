import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_service.g.dart';

@Riverpod(keepAlive: true)
PhotoService photoService(ProviderRef<PhotoService> ref) => PhotoService();

/// Captures a photo (camera) and compresses it client-side before it's ever
/// uploaded — per app-pre/mobile/DEPENDENCIES.MD's `flutter_image_compress`
/// recommendation ("saving mobile data bandwidth").
class PhotoService {
  final _picker = ImagePicker();

  /// Returns null if the user cancels the camera.
  Future<File?> captureAndCompress() async {
    final captured = await _picker.pickImage(source: ImageSource.camera, imageQuality: 90);
    if (captured == null) return null;

    final targetPath = '${captured.path}_compressed.jpg';
    final compressed = await FlutterImageCompress.compressAndGetFile(
      captured.path,
      targetPath,
      quality: 70,
      minWidth: 1280,
      minHeight: 1280,
    );

    return File((compressed ?? captured).path);
  }
}
