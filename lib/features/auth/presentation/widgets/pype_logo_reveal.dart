import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

/// The opening animation: the real logo image (`assets/images/app_logo.png`)
/// sits there desaturated and faint, then fades in and fills with its real
/// color as the animation progresses, then "Pype CRM" types itself out
/// underneath. Runs once and calls [onFinished].
///
/// Deliberately NOT a hand-traced vector redraw of the logo (a previous
/// version of this file tried that — stroke-drawing the ring/arrow shapes
/// via `CustomPainter`/`PathMetrics`) — without a real SVG source or a
/// contour-extraction tool in this environment, the hand-measured path
/// geometry didn't actually line up with the real mark closely enough.
/// Animating the real raster asset's opacity/saturation instead guarantees
/// pixel-exact fidelity to the actual logo at every point in the animation,
/// at the cost of a simpler reveal (no literal stroke-by-stroke drawing).
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

  // Phase boundaries as fractions of the whole timeline — overlapping so
  // the logo reveal and the text typing read as one continuous motion
  // rather than two separate steps with dead air between them.
  static const _logoRevealEnd = 0.62;
  static const _textRevealStart = 0.56;
  static const _textRevealEnd = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2200))
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
        final reveal = Curves.easeOutCubic.transform(_phase(0, _logoRevealEnd, t));
        final textReveal = Curves.easeInOut.transform(_phase(_textRevealStart, _textRevealEnd, t));

        final baseTextStyle = TextStyle(
          fontFamily: 'Poppins',
          fontSize: widget.size * 0.15,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.2,
          height: 1.2,
        );

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: widget.size,
              height: widget.size,
              child: _ColorFillLogo(progress: reveal, size: widget.size),
            ),
            SizedBox(height: widget.size * 0.1),
            Opacity(
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
                  style: baseTextStyle.copyWith(color: kMidnight),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// Shows the real logo asset starting faint/desaturated/slightly scaled
/// down, then fading in to full opacity, full color, and full size as
/// [progress] goes 0 -> 1 — a "fades in and fills with color" reveal
/// instead of a traced stroke-by-stroke redraw (see class doc comment on
/// [PypeLogoReveal]).
class _ColorFillLogo extends StatelessWidget {
  const _ColorFillLogo({required this.progress, required this.size});

  final double progress;
  final double size;

  /// Saturation matrix interpolated from fully desaturated (0) to the
  /// image's real colors (1) — standard luminance-weighted grayscale
  /// matrix, blended toward identity.
  List<double> _saturationMatrix(double saturation) {
    const lumR = 0.2126, lumG = 0.7152, lumB = 0.0722;
    final sInv = 1 - saturation;
    return [
      lumR * sInv + saturation, lumG * sInv, lumB * sInv, 0, 0,
      lumR * sInv, lumG * sInv + saturation, lumB * sInv, 0, 0,
      lumR * sInv, lumG * sInv, lumB * sInv + saturation, 0, 0,
      0, 0, 0, 1, 0,
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Opacity and saturation ramp together but opacity finishes first
    // (reaches 1 by the time progress is ~0.7) so most of the back half of
    // the reveal reads as "color filling in" on an already-visible mark,
    // not still fading from nothing.
    final opacity = (progress / 0.7).clamp(0.0, 1.0);
    final saturation = progress.clamp(0.0, 1.0);
    final scale = 0.88 + 0.12 * progress;

    return Opacity(
      opacity: opacity,
      child: Transform.scale(
        scale: scale,
        child: ColorFiltered(
          colorFilter: ColorFilter.matrix(_saturationMatrix(saturation)),
          child: Image.asset(
            'assets/images/app_logo.png',
            width: size,
            height: size,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
