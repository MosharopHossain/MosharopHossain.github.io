import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_route.dart';
import 'package:my_portfolio/constants/app_strings.dart';

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context) {
    return [
      AppMenu(title: AppStrings.home, path: Routes.home),
      AppMenu(title: AppStrings.aboutMe, path: Routes.aboutMe),
      AppMenu(title: AppStrings.courses, path: Routes.courses),
      AppMenu(title: AppStrings.aboutMe, path: Routes.aboutMe),
    ];
  }
}

class AppMenu {
  final String title;
  final String path;

  AppMenu({required this.title, required this.path});
}
