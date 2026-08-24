import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Brand purple — matches the nav bar/login button/greeting card. Filling
/// the growing circle with this (instead of plain white) is what makes the
/// transition actually read as "a circle popping open," not just a
/// corner-wipe — you see a solid colored blob balloon out from the bell
/// first, and only once it's grown do the (white-background) notifications
/// settle in on top of it.
const _brandPurple = Color(0xFF5B21B6);

/// A page transition that pops a colored circle open from [origin] (screen
/// coordinates — typically wherever the user tapped to navigate, e.g. the
/// notification bell's on-screen position) until it covers the whole
/// screen, revealing [child] inside it. The content itself fades in and
/// slides in slightly from the left once the circle is most of the way
/// open, rather than appearing instantly the moment the circle covers it.
class CircularRevealPage extends CustomTransitionPage<void> {
  CircularRevealPage({required super.key, required super.child, this.origin})
      : super(
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, pageChild) {
            final size = MediaQuery.sizeOf(context);
            // Falls back to roughly where an AppBar trailing icon sits, for
            // any caller that pushes this page without a captured origin.
            final center = origin ?? Offset(size.width - 28, 28);
            final maxRadius = _maxRadius(center, size);
            // `easeOutBack` overshoots slightly past full size then settles
            // back — that little bounce is what sells "popping open" rather
            // than a flat wipe. The brief >1 overshoot just makes the oval
            // momentarily bigger than the screen, which is harmless (it's
            // already covering every corner by that point).
            final reveal = CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
            // Content fade/slide only plays through the back third of the
            // reveal, once the purple circle is already most of the way
            // open, so the panel visibly "arrives" inside it rather than
            // being visible while the circle is still small.
            final contentIn = CurvedAnimation(
              parent: animation,
              curve: const Interval(0.55, 1.0, curve: Curves.easeOut),
            );

            return ClipPath(
              clipper: _CircleRevealClipper(center: center, maxRadius: maxRadius, reveal: reveal),
              child: ColoredBox(
                color: _brandPurple,
                child: FadeTransition(
                  opacity: contentIn,
                  child: SlideTransition(
                    position: Tween<Offset>(begin: const Offset(-0.08, 0), end: Offset.zero)
                        .animate(contentIn),
                    child: pageChild,
                  ),
                ),
              ),
            );
          },
        );

  /// Screen-space point the circle grows from. Null falls back to a
  /// top-right corner position.
  final Offset? origin;

  static double _maxRadius(Offset center, Size size) {
    final corners = <Offset>[
      Offset.zero,
      Offset(size.width, 0),
      Offset(0, size.height),
      Offset(size.width, size.height),
    ];
    return corners.map((c) => (c - center).distance).reduce(math.max);
  }
}

/// Circular clip that grows with [reveal] (0..1) — passed as the `reclip`
/// listenable so `ClipPath` repaints on every animation tick without the
/// surrounding `transitionsBuilder` needing to rebuild the widget tree
/// itself each frame.
class _CircleRevealClipper extends CustomClipper<Path> {
  _CircleRevealClipper({required this.center, required this.maxRadius, required this.reveal})
      : super(reclip: reveal);

  final Offset center;
  final double maxRadius;
  final Animation<double> reveal;

  @override
  Path getClip(Size size) =>
      Path()..addOval(Rect.fromCircle(center: center, radius: maxRadius * reveal.value));

  @override
  bool shouldReclip(covariant _CircleRevealClipper oldClipper) =>
      oldClipper.center != center || oldClipper.maxRadius != maxRadius;
}
