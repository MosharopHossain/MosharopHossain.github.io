import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/style/app_size.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';
import 'package:seo_renderer/seo_renderer.dart';

class HeroTexts extends StatelessWidget {
  const HeroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktop
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        SeoTexts(
          text: context.texts.shafiMunshi,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.start : TextAlign.center,
          textRendererStyle: TextRendererStyle.header1,
          style: context.textStyles.titleLgBold.copyWith(
            color: context.colorScheme.onBackground,
          ),
        ),
        Gap(Insets.sm),
        SeoTexts(
          text: context.texts.mobileAppDeveloper,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          textRendererStyle: TextRendererStyle.header2,
          style: context.textStyles.titleLgBold.copyWith(
            color: context.colorScheme.onBackground,
          ),
        ),
        Gap(Insets.lg),
        SeoTexts(
          text: context.texts.mobileAppDeveloper,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          textRendererStyle: TextRendererStyle.paragraph,
          style: context.textStyles.bodySmRegular.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
