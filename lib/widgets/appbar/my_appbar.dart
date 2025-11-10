import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_menu_list.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/home.dart';
import 'package:my_portfolio/style/app_size.dart';
import 'package:my_portfolio/widgets/appbar/app_bar_drawer_icon.dart';
import 'package:my_portfolio/widgets/appbar/drawer_menu.dart';
import 'package:my_portfolio/widgets/language_switch.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          alignment: Alignment.center,
          height: context.insets.appBarHeight,
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          // color: Theme.of(context).appBarTheme.backgroundColor,
          color: context.theme.appBarTheme.backgroundColor,
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: Insets.maxWidth),
            child: Row(
              children: [
                AppLogo(),
                Spacer(),
                if (context.isDesktop) LargeMenu(),
                Spacer(),
                LanguageSwitch(),
                ThemeToggle(),
                if (!context.isDesktop) AppbarDrawerIcon(),
              ],
            ),
          ),
        ),

        if (!context.isDesktop) DrawerMenu(),
      ],
    );
  }
}

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: AppMenuList.getItems(context)
          .map(
            (menu) => LargeAppBarMenuItem(
              text: menu.title,
              isSelected: false,
              onTap: () {},
            ),
          )
          .toList(),
    );
  }
}

class SmallMenu extends StatelessWidget {
  const SmallMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: AppMenuList.getItems(context)
          .map(
            (menu) => LargeAppBarMenuItem(
              text: menu.title,
              isSelected: false,
              onTap: () {},
            ),
          )
          .toList(),
    );
  }
}
