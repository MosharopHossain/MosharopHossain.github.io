import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/constants/app_strings.dart';
import 'package:my_portfolio/constants/projects_data.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/features/work/presentation/work_item.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';

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
              text: AppStrings.seeMyWork,
              style: context.textStyles.titleSmBold.copyWith(
                color: seeMyWorkTxtColor,
              ),
            ),
          ),
        ),
        Gap(32),
        if (context.isDesktopOrTablet) ...[
          HomeCourseListDesktop(),
        ],
        if (!context.isDesktopOrTablet) ...[
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
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: projectsData.length,
        itemBuilder: (context, index) {
          return WorkItem(
            projectData: projectsData[index],
            index: index,
          );
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
        children: projectsData
            .map((project) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: WorkItem(
                      projectData: project,
                      index: projectsData.indexOf(project)),
                ))
            .toList(),
      ),
    );
  }
}
