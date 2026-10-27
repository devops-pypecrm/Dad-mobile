import 'package:flutter/material.dart';

// Brand palette — Purple primary / Green secondary (swapped from the
// previous green-main/purple-accent pairing), with Coral/Cyan/Yellow as the
// categorical/status set (charts, priority chips) and Midnight for dark
// neutral surfaces/dark-mode backgrounds. Coral stands in for the old plain-
// red "error/negative" usage across the app — the palette has no red, and
// Coral reads as the same warm-alert signal.
const kBrandColor = Color(0xFF9654B5);
const kAccentColor = Color(0xFF45B83D);
const kCoral = Color(0xFFFF6B4A);
const kCyan = Color(0xFF00A8D6);
const kYellow = Color(0xFFF5B82E);
const kMidnight = Color(0xFF20243A);

/// Categorical order for charts/multi-series visualizations that need more
/// than the single brand color (e.g. lead-source pie/bar charts).
const kChartPalette = [kBrandColor, kAccentColor, kCoral, kCyan, kYellow, kMidnight];

class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // Poppins was already bundled as an asset (see pubspec.yaml) but never
    // actually applied anywhere — ThemeData had no fontFamily set, so the
    // whole app fell back to Flutter's Material default (Roboto). Setting
    // it here makes every TextTheme style (and anything that doesn't
    // explicitly override its own fontFamily) use it app-wide, matching
    // Dad-frontend's own "make Poppins the real default, not opt-in" fix.
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(seedColor: kBrandColor),
    scaffoldBackgroundColor: const Color(0xFFFAFAFC),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: kBrandColor.withValues(alpha: 0.05),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: kBrandColor, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: kCoral, width: 1.2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: kCoral, width: 1.6),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
  );

  /// Dark variant — a real inverted `ColorScheme.fromSeed` (brightness:
  /// dark), not just the light theme with a dark Scaffold slapped on, so
  /// surfaces/text/borders derived from the scheme (cards, inputs, dividers
  /// that read `Theme.of(context).colorScheme.*` rather than a hardcoded
  /// hex) invert correctly. `kMidnight` backs the scaffold/surface tone
  /// instead of Material's own near-black default, matching the new
  /// palette's own dark-neutral color.
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'Poppins',
    colorScheme: ColorScheme.fromSeed(
      seedColor: kBrandColor,
      brightness: Brightness.dark,
      surface: kMidnight,
    ),
    scaffoldBackgroundColor: kMidnight,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.06),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: kBrandColor, width: 1.6),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: kCoral, width: 1.2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(color: kCoral, width: 1.6),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    ),
    cardColor: const Color(0xFF2A2F47),
    dividerColor: Colors.white.withValues(alpha: 0.08),
  );
}
