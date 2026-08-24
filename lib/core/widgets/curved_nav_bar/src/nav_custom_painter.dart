// Vendored from package:curved_navigation_bar 1.0.6 — see
// ../curved_navigation_bar.dart for why this is a local fork, not a pub
// dependency.
//
// FORK: `elevation`/`shadowColor` added so the whole bar shape — notch
// included — casts a drop shadow via `canvas.drawShadow` on its own path,
// rather than depending on a color-contrast trick against whatever sits
// behind a transparent bar background. `cornerRadius` added so the bar
// reads as a floating rounded box (all 4 corners) instead of a flush,
// sharp-cornered rectangle — see "FORK:" below.
import 'package:flutter/material.dart';

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;
  // FORK: not in upstream — see file header.
  final double elevation;
  final Color shadowColor;
  final double cornerRadius;

  NavCustomPainter(double startingLoc, int itemsLength, this.color,
      this.textDirection,
      {this.elevation = 0, this.shadowColor = Colors.black, this.cornerRadius = 0}) {
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // FORK: corners rounded via quadratic arcs instead of the upstream
    // sharp-cornered `lineTo`s — clamp so the radius can never exceed half
    // the shorter side (degenerate/self-intersecting otherwise).
    final r = cornerRadius.clamp(0, size.height / 2).toDouble();

    // FORK: the two TOP corners shrink individually, only as much as needed
    // to stay clear of the dip's own flared shoulders — the dip's geometry
    // itself is untouched (still built from the real `loc`, unclamped), so
    // it stays full-size and perfectly aligned under the circle for every
    // tab, including the first/last. `leftFlareX`/`rightFlareX` are how far
    // the dip's `-0.1`/`+s+0.1` flare tips sit from their respective edge:
    // comfortably positive for a middle tab (corner stays fully rounded,
    // clamped at `r`), and negative for the first/last tab, where the flare
    // has actually crossed past that edge — clamped to 0 there, which
    // collapses that one corner back to sharp (identical to the original,
    // pre-rounding shape) exactly where a rounded arc would otherwise
    // self-intersect the dip and show up as a stray corner sliver.
    final leftFlareX = (loc - 0.1) * size.width;
    final rightFlareX = size.width - (loc + s + 0.1) * size.width;
    final topLeftR = leftFlareX.clamp(0, r).toDouble();
    final topRightR = rightFlareX.clamp(0, r).toDouble();

    final path = Path()
      ..moveTo(topLeftR, 0)
      ..lineTo((loc - 0.1) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.25) * size.width,
        size.height * 0.01,
        loc * size.width,
        size.height * 0.60,
        (loc + s * 0.50) * size.width,
        size.height * 0.60,
      )
      ..cubicTo(
        (loc + s) * size.width,
        size.height * 0.60,
        (loc + s - s * 0.25) * size.width,
        size.height * 0.01,
        (loc + s + 0.1) * size.width,
        0,
      )
      ..lineTo(size.width - topRightR, 0)
      ..quadraticBezierTo(size.width, 0, size.width, topRightR)
      ..lineTo(size.width, size.height - r)
      ..quadraticBezierTo(size.width, size.height, size.width - r, size.height)
      ..lineTo(r, size.height)
      ..quadraticBezierTo(0, size.height, 0, size.height - r)
      ..lineTo(0, topLeftR)
      ..quadraticBezierTo(0, 0, topLeftR, 0)
      ..close();
    // FORK: shadow follows the curved path itself (notch included), drawn
    // before the fill so the fill sits on top of it — see file header.
    if (elevation > 0) {
      canvas.drawShadow(path, shadowColor, elevation, false);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
