import 'package:flutter/material.dart' as material;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

@riverpod
class ThemeMode extends _$ThemeMode {
  static const String _themeModeKey = 'theme_mode';

  @override
  Future<material.ThemeMode> build() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_themeModeKey);

    if (isDarkMode == null) {
      return material.ThemeMode.system;
    }
    return isDarkMode ? material.ThemeMode.dark : material.ThemeMode.light;
  }

  Future<void> toggleTheme() async {
    final currentMode = state.hasValue
        ? state.requireValue
        : material.ThemeMode.system;

    final newMode = currentMode == material.ThemeMode.dark
        ? material.ThemeMode.light
        : material.ThemeMode.dark;

    state = AsyncValue.data(newMode);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeModeKey, newMode == material.ThemeMode.dark);
  }

  Future<void> setTheme(material.ThemeMode mode) async {
    state = AsyncValue.data(mode);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeModeKey, mode == material.ThemeMode.dark);
  }
}
