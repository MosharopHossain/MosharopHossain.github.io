import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/app_locale_controller.dart';
import 'package:my_portfolio/extension.dart';

import 'package:my_portfolio/style/app_size.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';

class LanguageSwitch extends ConsumerWidget {
  const LanguageSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleControllerProvider);
    return PopupMenuButton(
      initialValue: locale.value == 'en' ? 0 : 1,
      onSelected: (value) {
        if (value == 0) {
          ref.read(appLocaleControllerProvider.notifier).changeLocale('en');
        } else {
          ref.read(appLocaleControllerProvider.notifier).changeLocale('es');
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 0,
          child: PopupLanguageSwitchItem(language: 'English', icon: 'US.svg'),
        ),

        PopupMenuItem(
          value: 1,
          child: PopupLanguageSwitchItem(language: 'Spanish', icon: 'ES.svg'),
        ),
      ],

      child: Row(
        children: [
          Icon(Icons.language),
          Gap(Insets.med),
          SeoTexts(
            text:ref.watch(appLocaleControllerProvider).value == 'en'
                ? "En"
                : "Es",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: context.colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}

class PopupLanguageSwitchItem extends StatelessWidget {
  const PopupLanguageSwitchItem({
    super.key,
    required this.language,
    required this.icon,
  });

  final String language;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, width: 18, height: 18),
        Gap(8),
        SeoTexts(text: language, style: context.textStyles.bodyLgMedium),
      ],
    );
  }
}
