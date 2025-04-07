import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SettingsThemeMode {
  light('Light'),
  dark('Dark'),
  system('System');

  const SettingsThemeMode(this.alias);

  final String alias;
}

class ThemeService {
  static Future<void> saveThemeMode(
    String? userEmail,
    SettingsThemeMode themeMode,
  ) async {
    if (userEmail == null) {
      return;
    }
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('theme_mode_$userEmail', themeMode.name);
    } catch (e) {
      debugPrint('ThemeService - Error saving theme mode $e');
    }
  }

  static Future<ThemeMode?> getThemeMode(String? userEmail) async {
    if (userEmail == null) {
      return null;
    }
    try {
      final prefs = await SharedPreferences.getInstance();
      final themeMode = prefs.getString('theme_mode_$userEmail');
      if (themeMode != null) {
        try {
          return ThemeMode.values.firstWhere((e) => e.name == themeMode);
        } catch (e) {
          debugPrint('ThemeService - Error getting theme mode $e');
          return null;
        }
      }
      return null;
    } catch (e) {
      debugPrint('ThemeService - Error getting theme mode $e');
      return null;
    }
  }

  static Future<void> cleanThemeMode(String? userEmail) async {
    if (userEmail == null) {
      return;
    }
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('theme_mode_$userEmail');
    } catch (e) {
      debugPrint('ThemeService - Error cleaning theme mode $e');
    }
  }

  static Future<void> toggleTheme(
    BuildContext context,
    String? userEmail,
  ) async {
    final themeMode = await ThemeService.getThemeMode(userEmail);
    if (themeMode == ThemeMode.light) {
      await ThemeService.saveThemeMode(userEmail, SettingsThemeMode.dark);
    } else if (themeMode == ThemeMode.dark) {
      await ThemeService.saveThemeMode(userEmail, SettingsThemeMode.system);
    } else {
      await ThemeService.saveThemeMode(userEmail, SettingsThemeMode.light);
    }
  }
}
