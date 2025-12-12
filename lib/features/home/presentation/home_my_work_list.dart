import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/features/work/presentation/work_item.dart';
import 'package:my_portfolio/widgets/home_title_subtitle.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

// Project data constants
const List<ProjectData> _projects = [
  ProjectData(
    title: 'MOJI',
    subtitle: 'YOUR SHOPIFY SITE BUILT IN 7 DAYS OR IT\'S FREE',
    description:
        'We\'ve mastered the art of building high performance Shopify stores. Simply, affordably, and without the headaches.',
    imagePath: 'assets/template_mock.jpg',
  ),
  ProjectData(
    title: 'MARKETLEAP',
    subtitle: 'Let\'s get you growing',
    description:
        'Seamless ecommerce for D2C brands. We make it easy, so you can make it big.',
    imagePath: 'assets/template_mock.jpg',
  ),
  ProjectData(
    title: 'EXOPRIME',
    subtitle: 'Premium Investment Solutions',
    description:
        'Innovative financial services with cutting-edge technology for modern investors.',
    imagePath: 'assets/template_mock.jpg',
  ),
  ProjectData(
    title: 'LEN FORKAS',
    subtitle: 'INSPIRE YOUR TEAM',
    description:
        'Scientific leadership and speaker expertise to transform your organization.',
    imagePath: 'assets/template_mock.jpg',
  ),
];

class HomeMyWorkList extends StatefulWidget {
  const HomeMyWorkList({super.key});

  @override
  State<HomeMyWorkList> createState() => _HomeMyWorkListState();
}

class _HomeMyWorkListState extends State<HomeMyWorkList> {
  Color seeMyWorkColor = Colors.black;
  Color seeMyWorkTxtColor = Colors.white70;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MouseRegion(
          onEnter: (_) {
            setState(() {
              seeMyWorkColor = Colors.white70;
              seeMyWorkTxtColor = Colors.black;
            });
          },
          onExit: (_) {
            setState(() {
              seeMyWorkColor = Colors.black;
              seeMyWorkTxtColor = Colors.white70;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.insets.padding,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: seeMyWorkColor,
              border: Border.all(
                color: context.colorScheme.onBackground,
                width: 2,
              ),
            ),
            child: SeoTexts(
              text: 'See My Work',
              style: context.textStyles.titleSmBold.copyWith(
                color: seeMyWorkTxtColor,
              ),
              textRendererStyle: TextRendererStyle.header3,
            ),
          ),
        ),
        Gap(32),
        if (context.isDesktop) ...[
          HomeCourseListDesktop(),
        ],
        if (!context.isDesktop) ...[
          HomeCourseListMobile(),
        ],
      ],
    );
  }
}

class HomeCourseListDesktop extends StatelessWidget {
  const HomeCourseListDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: _projects.length,
        itemBuilder: (context, index) {
          return WorkItem(projectData: _projects[index]);
        },
      ),
    );
  }
}

class HomeCourseListMobile extends StatelessWidget {
  const HomeCourseListMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Column(
        children: _projects
            .map((project) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: WorkItem(projectData: project),
                ))
            .toList(),
      ),
    );
  }
}
