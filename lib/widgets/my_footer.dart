import 'package:flutter/material.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/features/home/presentation/home_page.dart';
import 'package:my_portfolio/widgets/appbar/my_appbar.dart';

class MyFooter extends StatelessWidget {
  const MyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.appBarTheme.backgroundColor,
      padding: EdgeInsets.all(context.insets.padding),
      child: Column(
        children: [
          context.isDesktop ? DesktopFooter() : PhoneFooter(),
          Divider(
            height: 24,
          ),
          Text('Flutter')
        ],
      ),
    );
  }
}

class PhoneFooter extends StatelessWidget {
  const PhoneFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppLogo(),
        SmallMenu(),
      ],
    );
  }
}

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppLogo(),
        Spacer(),
        LargeMenu(),
        Spacer(),
      ],
    );
  }
}
