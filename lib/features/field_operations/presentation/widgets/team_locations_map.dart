import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;

import '../../domain/field_team_member.dart';

const _brandColor = Color(0xFF578732);

/// "Live Team Locations" — OpenStreetMap tiles via `flutter_map`, the same
/// no-API-key approach as Dad-frontend's Leaflet-based `MapComponent.tsx`.
/// Markers are colored the same way the web page's status dot is (green =
/// checked in today, gray = not).
class TeamLocationsMap extends StatelessWidget {
  const TeamLocationsMap({super.key, required this.members});

  final List<FieldTeamMember> members;

  @override
  Widget build(BuildContext context) {
    if (members.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text('No GPS-tagged check-ins yet today.'),
        ),
      );
    }

    final points = members.map((m) => ll.LatLng(m.latitude!, m.longitude!)).toList();
    final center = points.length == 1
        ? points.first
        : ll.LatLng(
            points.map((p) => p.latitude).reduce((a, b) => a + b) / points.length,
            points.map((p) => p.longitude).reduce((a, b) => a + b) / points.length,
          );

    return FlutterMap(
      options: MapOptions(initialCenter: center, initialZoom: points.length == 1 ? 14 : 11),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.pypecrm.dad_mobile',
        ),
        MarkerLayer(
          markers: [
            for (final member in members)
              Marker(
                point: ll.LatLng(member.latitude!, member.longitude!),
                width: 44,
                height: 44,
                child: _MemberPin(member: member),
              ),
          ],
        ),
      ],
    );
  }
}

class _MemberPin extends StatelessWidget {
  const _MemberPin({required this.member});

  final FieldTeamMember member;

  @override
  Widget build(BuildContext context) {
    final color = member.isCheckedIn ? _brandColor : Colors.grey;
    return Tooltip(
      message: '${member.name}\n${member.location}',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 1))],
            ),
            child: Center(
              child: Text(
                member.initials,
                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CustomPaint(size: const Size(8, 6), painter: _PinTailPainter(color: color)),
        ],
      ),
    );
  }
}

class _PinTailPainter extends CustomPainter {
  const _PinTailPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant _PinTailPainter oldDelegate) => oldDelegate.color != color;
}
