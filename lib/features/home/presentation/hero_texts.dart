import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/l10n/app_strings.dart';
import 'package:my_portfolio/style/app_size.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';
import 'package:seo_renderer/seo_renderer.dart';

class HeroTexts extends StatelessWidget {
  const HeroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktopOrTablet
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        SeoTexts(
          text: AppStrings.myProfession,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.start : TextAlign.center,
          textRendererStyle: TextRendererStyle.header1,
          style: context.textStyles.titleLgBold.copyWith(
            color: context.colorScheme.onBackground,
          ),
        ),
        Gap(Insets.sm),
        // SeoTexts(
        //   text: AppStrings.myIntroduction,
        //   textAlign:
        //       context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
        //   textRendererStyle: TextRendererStyle.header2,
        //   style: context.textStyles.titleLgBold.copyWith(
        //     color: context.colorScheme.onBackground,
        //   ),
        // ),
        Gap(Insets.lg),
        SeoTexts(
          text: AppStrings.myIntroduction,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.start : TextAlign.center,
          textRendererStyle: TextRendererStyle.paragraph,
          style: context.textStyles.bodyLgMedium.copyWith(
            color: context.colorScheme.onBackground,
          ),
        ),
        SeoTexts(
          text: AppStrings.passionateDeveloper,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.start : TextAlign.center,
          textRendererStyle: TextRendererStyle.paragraph,
          style: context.textStyles.bodySmRegular.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
        SeoTexts(
          text: AppStrings.selfTaughtProgrammer,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.start : TextAlign.center,
          textRendererStyle: TextRendererStyle.paragraph,
          style: context.textStyles.bodySmRegular.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
        SeoTexts(
          text: AppStrings.aiMlEnthusiast,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.start : TextAlign.center,
          textRendererStyle: TextRendererStyle.paragraph,
          style: context.textStyles.bodySmRegular.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
        SeoTexts(
          text: AppStrings.competitiveProgrammer,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.start : TextAlign.center,
          textRendererStyle: TextRendererStyle.paragraph,
          style: context.textStyles.bodySmRegular.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
      ],
    );
  }
}
