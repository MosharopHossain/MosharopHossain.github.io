import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/app_text_styles.dart';
import 'package:my_portfolio/constants/app_menu_list.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/style/app_size.dart';
import 'package:my_portfolio/style/app_theme_controller.dart';
import 'package:my_portfolio/widgets/appbar/my_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [MyAppBar()]));
  }
}

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(appThemeControllerProvider);
    return Switch(
      onChanged: (val) {
        ref
            .read(appThemeControllerProvider.notifier)
            .changeTheme(val ? ThemeMode.dark : ThemeMode.light);
      },
      value: state.value == ThemeMode.dark,
    );
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('My Portfolio', style: context.textStyles.titleLgBold);
  }
}

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // children: [
      //   Text(context.texts.home, style: context.textStyles.bodyLgMedium),
      //   Text(context.texts.courses, style: context.textStyles.bodyLgMedium),
      //   Text(context.texts.blog, style: context.textStyles.bodyLgMedium),
      //   Text(context.texts.aboutMe, style: context.textStyles.bodyLgMedium),
      // ],
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

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Insets.med,
          vertical: Insets.xs,
        ),
        decoration: isSelected
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: context.theme.primaryColor,
                    width: 2,
                  ),
                ),
              )
            : null,
        child: Text(text, style: SmallTextStyles().bodyLgMedium),
      ),
    );
  }
}
