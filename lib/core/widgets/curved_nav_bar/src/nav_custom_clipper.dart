// Vendored from package:curved_navigation_bar 1.0.6 — see
// ../curved_navigation_bar.dart for why this is a local fork, not a pub
// dependency. Unmodified from upstream.
import 'package:flutter/cupertino.dart';

class NavCustomClipper extends CustomClipper<Rect> {
  final double deviceHeight;

  NavCustomClipper({required this.deviceHeight});

  @override
  Rect getClip(Size size) {
    //Clip only the bottom of the widget
    return Rect.fromLTWH(
      0,
      -deviceHeight + size.height,
      size.width,
      deviceHeight,
    );
  }

  @override
  bool shouldReclip(NavCustomClipper oldClipper) {
    return oldClipper.deviceHeight != deviceHeight;
  }
}
