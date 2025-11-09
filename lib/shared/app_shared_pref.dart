import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPref {
  static const localeKey = 'app_locale';
  static const themeKey = 'app_theme';

  static Future<void> setAppLocale(String locale) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(localeKey, locale);
  }

  static Future<String> getAppLocale() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(localeKey) ?? 'en';
  }

  static Future<void> setAppTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(themeKey, theme);
  }

  static Future<ThemeMode> getAppTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(themeKey) == 'light'
        ? ThemeMode.light
        : ThemeMode.dark;
  }
}
