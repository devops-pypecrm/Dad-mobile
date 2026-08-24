import 'package:flutter/material.dart';

/// A 2-column grid of cards whose row height is driven by content, not a
/// fixed `childAspectRatio` — `GridView.count(childAspectRatio: ...)` forces
/// every cell to the same height regardless of text content, which
/// overflows (`RenderFlex` error) once the system font scale is large
/// enough that a card's natural content no longer fits the ratio-derived
/// height. This lays out pairs as `IntrinsicHeight` rows instead, so each
/// row simply grows to fit whichever of its two cards is taller.
class TwoColumnGrid extends StatelessWidget {
  const TwoColumnGrid({super.key, required this.children, this.spacing = 12});

  final List<Widget> children;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i += 2) {
      final hasSecond = i + 1 < children.length;
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: children[i]),
              SizedBox(width: spacing),
              Expanded(child: hasSecond ? children[i + 1] : const SizedBox.shrink()),
            ],
          ),
        ),
      );
      if (i + 2 < children.length) rows.add(SizedBox(height: spacing));
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: rows);
  }
}
