import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_route.dart';
import 'package:my_portfolio/extension.dart';

class AppMenuList {
  static List<AppMenu> getItems(BuildContext context){
    return [
      AppMenu(title: context.texts.home, path: Routes.home),
      AppMenu(title: context.texts.aboutMe, path: Routes.aboutMe),
      AppMenu(title: context.texts.blog, path: Routes.blog),
      AppMenu(title: context.texts.courses, path: Routes.courses),
      AppMenu(title: context.texts.aboutMe, path: Routes.aboutMe),
    ];
  }
}

class AppMenu {
  final String title;
  final String path;

  AppMenu({required this.title, required this.path});
}