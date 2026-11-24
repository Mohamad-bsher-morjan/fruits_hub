import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruits_hub/constants.dart';
import 'package:fruits_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruits_hub/core/theme/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() async {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    await Prefs.init();
  });

  test('defaults to following the system when no preference is stored', () {
    final provider = ThemeProvider();

    expect(provider.themeMode, ThemeMode.system);
    expect(provider.isDarkMode, isFalse);
  });

  test('stores the selected mode and restores it on the next launch', () async {
    final provider = ThemeProvider();
    await provider.setThemeMode(ThemeMode.dark);

    expect(Prefs.getString(kThemeMode), 'dark');
    expect(ThemeProvider().themeMode, ThemeMode.dark);

    await provider.setThemeMode(ThemeMode.system);
    expect(ThemeProvider().themeMode, ThemeMode.system);
  });

  test('toggle switches between light and dark', () async {
    final provider = ThemeProvider();

    await provider.toggleTheme();
    expect(provider.themeMode, ThemeMode.dark);
    expect(provider.isDarkMode, isTrue);

    await provider.toggleTheme();
    expect(provider.themeMode, ThemeMode.light);
    expect(provider.isDarkMode, isFalse);
  });
}
