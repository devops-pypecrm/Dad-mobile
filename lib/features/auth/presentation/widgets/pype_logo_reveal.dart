import 'dart:math' as math;

import 'package:flutter/material.dart';

/// The full opening animation: the two concentric ring strokes of the Pype
/// mark draw themselves on, then the arrow silhouette appears and fills
/// bottom-to-top with brand green like a container of liquid, then "Pype
/// CRM" types itself out underneath. Runs once and calls [onFinished].
///
/// Every measurement in `_LogoPainter` (ring radii/thickness, the gap angle,
/// the arrow's 9 vertices) was traced pixel-for-pixel from
/// `assets/newlogo.png` (a 1254x1254 source) — see the geometry constants'
/// doc comments — rather than eyeballed, so the drawn mark lines up with the
/// real logo exactly instead of just resembling it. A raster PNG has no
/// notion of "half-drawn" though, which is why this exists as a painter
/// instead of just animating the image's opacity.
class PypeLogoReveal extends StatefulWidget {
  const PypeLogoReveal({super.key, required this.onFinished, this.size = 200});

  final VoidCallback onFinished;
  final double size;

  @override
  State<PypeLogoReveal> createState() => _PypeLogoRevealState();
}

class _PypeLogoRevealState extends State<PypeLogoReveal> with SingleTickerProviderStateMixin {
  static const _text = 'Pype CRM';

  late final AnimationController _controller;

  // Phase boundaries as fractions of the whole timeline. Deliberately
  // overlapping (e.g. the inner ring starts before the outer one finishes,
  // the liquid fill starts before the arrow outline is fully settled) so
  // the sequence reads as one continuous motion instead of a series of
  // discrete steps with dead air between them.
  static const _outerRingEnd = 0.34;
  static const _innerRingStart = 0.24;
  static const _innerRingEnd = 0.54;
  static const _liquidFillStart = 0.58;
  static const _liquidFillEnd = 0.88;
  static const _textRevealStart = 0.76;
  static const _textRevealEnd = 1.0;
  static const _introFadeEnd = 0.04;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 4200))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) widget.onFinished();
      })
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _phase(double start, double end, double t) {
    if (t <= start) return 0;
    if (t >= end) return 1;
    return (t - start) / (end - start);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final t = _controller.value;
        final introOpacity = Curves.easeOut.transform(_phase(0, _introFadeEnd, t));
        final outerProgress = Curves.easeInOutCubic.transform(_phase(0, _outerRingEnd, t));
        final innerProgress = Curves.easeInOutCubic.transform(_phase(_innerRingStart, _innerRingEnd, t));
        final liquidProgress = Curves.easeInOutCubic.transform(_phase(_liquidFillStart, _liquidFillEnd, t));
        // The word "writes itself" left-to-right, one continuous stroke of
        // ink sweeping across all the letters — not a stroke-then-fill pair
        // (there's only ever one paint here) and not a per-character
        // typewriter jump.
        final textReveal = Curves.easeInOut.transform(_phase(_textRevealStart, _textRevealEnd, t));

        final baseTextStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: widget.size * 0.15,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
          height: 1.2,
        );

        return Opacity(
          opacity: introOpacity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: widget.size,
                height: widget.size,
                child: CustomPaint(
                  painter: _LogoPainter(
                    outerProgress: outerProgress,
                    innerProgress: innerProgress,
                    liquidProgress: liquidProgress,
                    wavePhase: t * math.pi * 4,
                  ),
                ),
              ),
              SizedBox(height: widget.size * 0.1),
              Opacity(
                // Guards against the hard-edge gradient's stop-at-0 leaking a
                // sliver of the first letter into view before the reveal
                // actually starts (see the stops below).
                opacity: textReveal > 0 ? 1 : 0,
                child: ShaderMask(
                  blendMode: BlendMode.dstIn,
                  shaderCallback: (bounds) {
                    final edge = (textReveal + 0.03).clamp(0.0, 1.0);
                    return LinearGradient(
                      colors: const [Colors.white, Colors.white, Colors.transparent],
                      stops: [0.0, textReveal, edge],
                    ).createShader(bounds);
                  },
                  child: Text(
                    _text,
                    style: baseTextStyle.copyWith(color: const Color(0xFF1B1A1A)),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LogoPainter extends CustomPainter {
  _LogoPainter({
    required this.outerProgress,
    required this.innerProgress,
    required this.liquidProgress,
    required this.wavePhase,
  });

  final double outerProgress;
  final double innerProgress;
  final double liquidProgress;
  final double wavePhase;

  /// Traced from the PNG's dominant dark pixel value (27, 26, 26).
  static const _ringColor = Color(0xFF1B1A1A);

  /// Traced from the PNG's dominant green pixel value (119, 189, 68) — the
  /// logo's own arrow green, distinct from `kBrandColor` used elsewhere in
  /// the app's UI (buttons etc.), which is a darker/more muted shade.
  static const _arrowGreen = Color(0xFF77BD44);

  /// All geometry below is in the source PNG's own 1254x1254 pixel space;
  /// `paint()` just scales every point by `size / _canvas` so it reproduces
  /// the reference image's proportions exactly at any render size.
  static const _canvas = 1254.0;
  static const _cx = 626.2;
  static const _cy = 672.5;

  // Circle-fit results (least-squares fit against the PNG's actual ring
  // edge pixels — see the reverse-engineering notes in git history for this
  // file if these ever need re-deriving from a new logo asset).
  static const _outerOuterR = 548.4;
  static const _outerInnerR = 439.2;
  static const _innerOuterR = 284.0;
  static const _innerInnerR = 177.6;

  /// Both rings open with the same ~90 degree gap at the top, centered on
  /// the vertical axis, measured from where each ring's round-stroke-cap
  /// tip sits (confirmed independently for both rings — see notes).
  static const _gapDegrees = 90.0;

  /// The arrow's exact outline, traced via OpenCV contour extraction on the
  /// green mask then simplified with `approxPolyDP` (which converged to
  /// these same 9 points at every tolerance tried) — a barbed/fletched
  /// arrow shape, not a plain chevron: each wing dips into a concave notch
  /// before rising back up to meet the stem.
  static const _arrowPoints = [
    Offset(626, 61), // tip
    Offset(324, 363), // left wingtip
    Offset(417, 455), // left notch (concave)
    Offset(548, 326), // left stem-top corner
    Offset(548, 706), // left stem-bottom corner (base)
    Offset(704, 707), // right stem-bottom corner (base)
    Offset(705, 327), // right stem-top corner
    Offset(836, 455), // right notch (concave)
    Offset(929, 363), // right wingtip
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final scale = math.min(size.width, size.height) / _canvas;
    canvas.save();
    canvas.scale(scale);
    final center = const Offset(_cx, _cy);

    _drawRing(canvas, center, (_outerOuterR + _outerInnerR) / 2, _outerOuterR - _outerInnerR, outerProgress);
    _drawRing(canvas, center, (_innerOuterR + _innerInnerR) / 2, _innerOuterR - _innerInnerR, innerProgress);

    if (liquidProgress > 0) {
      _drawArrow(canvas);
    }
    canvas.restore();
  }

  void _drawRing(Canvas canvas, Offset center, double radius, double strokeWidth, double progress) {
    if (progress <= 0) return;
    final rect = Rect.fromCircle(center: center, radius: radius);
    const gapHalf = _gapDegrees / 2;
    const startDeg = -90 + gapHalf;
    const sweepDeg = 360 - _gapDegrees;

    final fullPath = Path()..addArc(rect, startDeg * math.pi / 180, sweepDeg * math.pi / 180);

    final metric = fullPath.computeMetrics().first;
    final drawPath = metric.extractPath(0, metric.length * progress.clamp(0, 1));

    final paint = Paint()
      ..color = _ringColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(drawPath, paint);
  }

  Path _arrowPath() {
    final path = Path()..moveTo(_arrowPoints.first.dx, _arrowPoints.first.dy);
    for (final p in _arrowPoints.skip(1)) {
      path.lineTo(p.dx, p.dy);
    }
    return path..close();
  }

  void _drawArrow(Canvas canvas) {
    final arrow = _arrowPath();
    final bounds = arrow.getBounds();

    // No outline and no pre-fill: the arrow shape only becomes visible as
    // the liquid itself rises inside it, so the viewer reads the arrow at
    // the moment it's fully green, not as an outline that then fills in.
    // Liquid fill: a wavy-top rect intersected with the arrow silhouette,
    // rising from the base to the tip as `liquidProgress` goes 0 -> 1.
    final level = bounds.bottom - bounds.height * liquidProgress;
    final wave = Path()..moveTo(bounds.left - 4, level);
    const step = 8.0;
    final amplitude = liquidProgress < 1 ? 6.0 : 0.0;
    for (double x = bounds.left - 4; x <= bounds.right + 4; x += step) {
      final y = level + amplitude * math.sin((x * 0.045) + wavePhase);
      wave.lineTo(x, y);
    }
    wave
      ..lineTo(bounds.right + 4, bounds.bottom + 4)
      ..lineTo(bounds.left - 4, bounds.bottom + 4)
      ..close();

    final liquid = Path.combine(PathOperation.intersect, arrow, wave);
    canvas.drawPath(liquid, Paint()..color = _arrowGreen);
  }

  @override
  bool shouldRepaint(covariant _LogoPainter oldDelegate) {
    return oldDelegate.outerProgress != outerProgress ||
        oldDelegate.innerProgress != innerProgress ||
        oldDelegate.liquidProgress != liquidProgress ||
        oldDelegate.wavePhase != wavePhase;
  }
}
