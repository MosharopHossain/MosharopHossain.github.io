import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/features/home/presentation/hero_buttons.dart';
import 'package:my_portfolio/features/home/presentation/hero_image.dart';
import 'package:my_portfolio/features/home/presentation/hero_texts.dart';
import 'package:my_portfolio/style/app_size.dart';
import 'package:my_portfolio/widgets/created_using_flutter.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreatedUsingFlutter(),
        context.isDesktop || context.isTablet ? LargeHero() : SmallHero(),
      ],
    );
  }
}

class SmallHero extends StatelessWidget {
  const SmallHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 140),
          child: HeroImage(),
        ),
        Gap(Insets.xl),
        HeroTexts(),
        Gap(Insets.xl),
        SmallHeroButtons(),
      ],
    );
  }
}

class LargeHero extends StatelessWidget {
  const LargeHero({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: HeroImage()),
        Gap(Insets.xxxl),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: context.isDesktopOrTablet
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [HeroTexts(), Gap(Insets.xxl), LargeHeroButtons()],
          ),
        ),
      ],
    );
  }
}
