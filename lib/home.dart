import 'package:flutter/material.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/l10n/app_localizations.dart';
import 'package:my_portfolio/style/app_size.dart';
import 'package:my_portfolio/widgets/appbar/my_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [MyAppBar()]));
  }
}



class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(onChanged: (val) {}, value: false);
  }
}

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text('My Portfolio', style: context.textStyles.titleLgBold);
  }
}

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(context.texts.home, style: context.textStyles.bodyLgMedium,),
        Text(context.texts.courses, style: context.textStyles.bodyLgMedium,),
        Text(context.texts.blog, style: context.textStyles.bodyLgMedium,),
        Text(context.texts.aboutMe, style: context.textStyles.bodyLgMedium,),
      ],
    );
  }
}

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'en', child: Text('English')),
        const PopupMenuItem(value: 'es', child: Text('Spanish')),
      ],
    );
  }
}
