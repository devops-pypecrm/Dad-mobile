import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_service.g.dart';

@Riverpod(keepAlive: true)
LocationService locationService(ProviderRef<LocationService> ref) => LocationService();

class LocationServicesOffException implements Exception {}

/// [isPermanent] true means the OS will no longer show the permission
/// prompt — the user must be sent to app settings instead.
class LocationPermissionDeniedException implements Exception {
  LocationPermissionDeniedException({required this.isPermanent});
  final bool isPermanent;
}

/// Thin wrapper around `geolocator`. Callers are expected to show an
/// explanatory dialog BEFORE calling this — see .claude/skills/field-force.md's
/// "Common Mistakes: requesting location permissions without explaining why".
class LocationService {
  Future<Position> getCurrentPosition() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) throw LocationServicesOffException();

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw LocationPermissionDeniedException(isPermanent: false);
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw LocationPermissionDeniedException(isPermanent: true);
    }

    return Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
    );
  }

  /// Best-effort "is this device reporting a mock/spoofed location" check —
  /// per app-pre/mobile/FIELD_FORCE_ANALYSIS.MD's "Location Spoofing
  /// Prevention" note. `Position.isMocked` is Android-only; always `false`
  /// on iOS since the platform has no equivalent signal.
  bool isLikelyMocked(Position position) => position.isMocked;
}
