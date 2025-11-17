import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/features/course/presentation/course_item.dart';
import 'package:my_portfolio/widgets/home_title_subtitle.dart';

class HomeCourseList extends StatelessWidget {
  const HomeCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeTitleSubtitle(
            title: context.texts.courses,
            subtitle: context.texts.mobileAppDeveloper),
        Gap(32),
        if (context.isDesktop) ...[
          HomeCourseListDesktop(),
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
      child: Row(
        children: [
          Expanded(child: CourseItem()),
          Expanded(child: CourseItem()),
          Expanded(child: CourseItem()),
        ],
      ),
    );
  }
}
