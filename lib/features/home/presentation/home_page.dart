import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/app_text_styles.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/features/home/presentation/experiences_body.dart';
import 'package:my_portfolio/features/home/presentation/hero_widget.dart';
import 'package:my_portfolio/features/home/presentation/home_footer.dart';
import 'package:my_portfolio/features/home/presentation/home_my_work_list.dart';
import 'package:my_portfolio/features/home/presentation/home_social_link.dart';
import 'package:my_portfolio/features/home/presentation/home_tool_list.dart';
import 'package:my_portfolio/style/app_size.dart';
import 'package:my_portfolio/style/app_theme_controller.dart';
import 'package:my_portfolio/widgets/background_blur.dart';
import 'package:my_portfolio/widgets/created_using_flutter.dart';
import 'package:my_portfolio/widgets/my_footer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackgroundBlur(),
        Align(
          child: Container(
            padding: EdgeInsets.only(top: Insets.xxl),
            constraints: BoxConstraints(maxWidth: Insets.maxWidth),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: context.insets.padding),
                  child: HeroWidget(),
                )),
                SliverToBoxAdapter(child: HomeToolList()),
                SliverToBoxAdapter(child: HomeMyWorkList()),
                // SliverToBoxAdapter(child: ExperiencesBody()),
                SliverToBoxAdapter(child: HomeSocialLink()),
                SliverToBoxAdapter(child: HomeFooter())
              ],
            ),
          ),
        ),
        // MyAppBar()
      ]),
    );
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
