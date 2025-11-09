import 'package:flutter/material.dart';
import 'package:my_portfolio/shared/app_shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'app_theme_controller.g.dart';

@riverpod
class AppThemeController extends _$AppThemeController {
  @override
  FutureOr<ThemeMode> build() {
    return AppSharedPref.getAppTheme();
  }

  void changeTheme(ThemeMode newTheme) async {
    await AppSharedPref.setAppTheme(
        newTheme == ThemeMode.light ? 'light' : 'dark');
    update((st) => newTheme);
  }
}
