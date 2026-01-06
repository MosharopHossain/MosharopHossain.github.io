import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/constants/app_strings.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/style/app_colors.dart';
import 'package:my_portfolio/style/app_size.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';

class HeroTexts extends StatefulWidget {
  const HeroTexts({super.key});

  @override
  State<HeroTexts> createState() => _HeroTextsState();
}

class _HeroTextsState extends State<HeroTexts> {
  int defaultWidth = 40;
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

          style: context.textStyles.bodyLgMedium.copyWith(
            color: context.colorScheme.onBackground,
          ),
        ),
        SeoTexts(
          text: AppStrings.passionateDeveloper,
          textAlign:
              context.isDesktopOrTablet ? TextAlign.start : TextAlign.center,

          style: context.textStyles.bodySmRegular.copyWith(
            color: context.colorScheme.onSurface,
          ),
        ),
        Gap(20),

        MouseRegion(
          onEnter: (event) {
            setState(() {
              defaultWidth = 120;
            });
          },
          onExit: (event) {
            setState(() {
              defaultWidth = 40;
            });
          },
          child: Stack(
            alignment: context.isDesktopOrTablet
                ? Alignment.centerLeft
                : Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: defaultWidth * 1.0,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              AnimatedOpacity(
                opacity: 1,
                duration: const Duration(milliseconds: 200),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Row(
                    mainAxisAlignment: context.isDesktopOrTablet
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: [
                      SeoTexts(
                        text: 'Say Hello',
                        style: context.textStyles.bodySmRegular.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Icon(Icons.arrow_right_alt,
                          color: AppColors.white, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
