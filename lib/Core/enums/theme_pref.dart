import 'package:flutter/material.dart';

enum ThemePref { light, dark }

extension ThemePrefExtension on ThemePref {
  String get name => toString().split('.').last;

  static ThemePref fromString(String? value) {
    return ThemePref.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ThemePref.light,
    );
  }

  ThemeMode get themeMode {
    switch (this) {
      case ThemePref.dark:
        return ThemeMode.dark;
      case ThemePref.light:
        return ThemeMode.light;
    }
  }
}
