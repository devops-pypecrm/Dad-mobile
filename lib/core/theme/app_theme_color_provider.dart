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
