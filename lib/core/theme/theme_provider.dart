import 'package:flutter/material.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() : _themeMode = _readStoredMode();

  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  static ThemeMode _readStoredMode() {
    switch (Prefs.getString(kThemeMode)) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        // Follow the platform on first launch, and when no valid value exists.
        return ThemeMode.system;
    }
  }

  static String _modeName(ThemeMode mode) => switch (mode) {
        ThemeMode.light => 'light',
        ThemeMode.dark => 'dark',
        ThemeMode.system => 'system',
      };

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
    _themeMode = mode;
    // Rebuild immediately; persistence can finish in the background.
    notifyListeners();
    await Prefs.setString(kThemeMode, _modeName(mode));
  }

  Future<void> toggleTheme() {
    return setThemeMode(isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
