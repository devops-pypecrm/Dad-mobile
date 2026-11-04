import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_theme.dart';

part 'app_theme_color_provider.g.dart';

const _prefsKey = 'app_theme_seed_color';

/// One selectable theme color option — a name plus the seed color
/// `ColorScheme.fromSeed` builds the whole Material palette from. Reuses
/// the app's own existing brand palette constants (app_theme.dart) rather
/// than inventing new arbitrary colors, so every option already has a
/// real, designated name/role in the app instead of being a random swatch.
class AppThemeOption {
  const AppThemeOption({required this.name, required this.seedColor});

  final String name;
  final Color seedColor;
}

const appThemeOptions = [
  AppThemeOption(name: 'Purple', seedColor: kBrandColor),
  AppThemeOption(name: 'Green', seedColor: kAccentColor),
  AppThemeOption(name: 'Coral', seedColor: kCoral),
  AppThemeOption(name: 'Cyan', seedColor: kCyan),
  AppThemeOption(name: 'Yellow', seedColor: kYellow),
  AppThemeOption(name: 'Midnight', seedColor: kMidnight),
  // Extra variety beyond the core brand palette — plain hand-picked swatches
  // (not tied to any brand-identity constant) spanning the rest of the hue
  // wheel, so "Theme Color" has a real gallery to pick from rather than
  // just the 6 colors the brand/chart palette happens to define.
  AppThemeOption(name: 'Blue', seedColor: Color(0xFF2563EB)),
  AppThemeOption(name: 'Indigo', seedColor: Color(0xFF4F46E5)),
  AppThemeOption(name: 'Violet', seedColor: Color(0xFF8B5CF6)),
  AppThemeOption(name: 'Sky', seedColor: Color(0xFF0EA5E9)),
  AppThemeOption(name: 'Teal', seedColor: Color(0xFF14B8A6)),
  AppThemeOption(name: 'Emerald', seedColor: Color(0xFF10B981)),
  AppThemeOption(name: 'Lime', seedColor: Color(0xFF84CC16)),
  AppThemeOption(name: 'Amber', seedColor: Color(0xFFF59E0B)),
  AppThemeOption(name: 'Orange', seedColor: Color(0xFFF97316)),
  AppThemeOption(name: 'Rose', seedColor: Color(0xFFE11D48)),
  AppThemeOption(name: 'Pink', seedColor: Color(0xFFEC4899)),
  AppThemeOption(name: 'Fuchsia', seedColor: Color(0xFFD946EF)),
  AppThemeOption(name: 'Slate', seedColor: Color(0xFF475569)),
  AppThemeOption(name: 'Brown', seedColor: Color(0xFF8D6E63)),
];

/// User's chosen theme color, persisted across launches via
/// SharedPreferences (stored as the color's 32-bit ARGB int) — same
/// pattern/rationale as `AppThemeMode` (cosmetic preference, not
/// sensitive, so the plain unencrypted store is the right tool). Defaults
/// to the original brand purple for a fresh install.
@Riverpod(keepAlive: true)
class AppSeedColor extends _$AppSeedColor {
  @override
  Color build() {
    _restore();
    return kBrandColor;
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getInt(_prefsKey);
    if (saved != null) state = Color(saved);
  }

  Future<void> setColor(Color color) async {
    state = color;
    final prefs = await SharedPreferences.getInstance();
    // ignore: deprecated_member_use
    await prefs.setInt(_prefsKey, color.value);
  }
}
