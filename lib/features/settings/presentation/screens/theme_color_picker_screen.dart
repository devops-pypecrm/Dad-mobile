import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/app_theme_color_provider.dart';

/// Full-page "Theme Color" picker — a grid of swatches, each rendered as a
/// small live mockup of a real app screen (app bar, a card, a filled
/// button) built from that swatch's own `AppTheme.light/dark`, so picking a
/// color is an actual visual preview rather than a bare dot + name in a
/// bottom sheet. Tapping a swatch applies it immediately, same as before.
class ThemeColorPickerScreen extends ConsumerWidget {
  const ThemeColorPickerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final current = ref.watch(appSeedColorProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(title: const Text('Theme Color')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 0.82,
        ),
        itemCount: appThemeOptions.length,
        itemBuilder: (context, index) {
          final option = appThemeOptions[index];
          final selected = option.seedColor == current;
          return _ThemeSwatchCard(
            option: option,
            selected: selected,
            isDark: isDark,
            onTap: () => ref.read(appSeedColorProvider.notifier).setColor(option.seedColor),
          );
        },
      ),
    );
  }
}

class _ThemeSwatchCard extends StatelessWidget {
  const _ThemeSwatchCard({
    required this.option,
    required this.selected,
    required this.isDark,
    required this.onTap,
  });

  final AppThemeOption option;
  final bool selected;
  final bool isDark;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final previewTheme = isDark
        ? AppTheme.dark(seedColor: option.seedColor)
        : AppTheme.light(seedColor: option.seedColor);
    final scheme = previewTheme.colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? option.seedColor : Theme.of(context).colorScheme.outlineVariant,
            width: selected ? 2.4 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // The mini "screen" preview, themed with this option's own
            // derived ColorScheme (not just the raw seed) so it matches
            // what actually applying this color would look like.
            Expanded(
              child: Container(
                color: scheme.surface,
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Fake app bar.
                    Container(
                      height: 20,
                      decoration: BoxDecoration(
                        color: scheme.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 28,
                        height: 6,
                        decoration: BoxDecoration(
                          color: scheme.onPrimary.withValues(alpha: 0.85),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Fake content card.
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: scheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              height: 5,
                              decoration: BoxDecoration(
                                color: scheme.onPrimaryContainer.withValues(alpha: 0.55),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: 40,
                              height: 5,
                              decoration: BoxDecoration(
                                color: scheme.onPrimaryContainer.withValues(alpha: 0.3),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Fake filled button.
                    Container(
                      height: 16,
                      decoration: BoxDecoration(
                        color: scheme.primary,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Name + selection row.
            Container(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                children: [
                  CircleAvatar(radius: 7, backgroundColor: option.seedColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      option.name,
                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (selected) Icon(Icons.check_circle, size: 16, color: option.seedColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
