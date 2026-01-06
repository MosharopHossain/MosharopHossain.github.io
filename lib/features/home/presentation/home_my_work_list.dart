import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/features/work/presentation/work_item.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';


// Project data constants
const List<ProjectData> projectsData = [
  ProjectData(
    title: 'Tijarah',
    subtitle:
        'A POS and Inventory Management System for Small and Medium Businesses',
    description:
        'Comprehensive point-of-sale solution with real-time inventory tracking, sales analytics, and multi-location support for retail businesses.',
    imagePath: 'assets/images/tijarah_cover.png',
    playStoreUrl:
        'https://play.google.com/store/apps/details?id=com.ragory.tijarah.software&pcampaignid=web_share',
  ),
  ProjectData(
      title: 'SofiaIQ Rust',
      subtitle: 'Educational app to learn Rust programming language',
      description:
          'Interactive learning platform featuring hands-on coding exercises, memory safety tutorials, quiz and performance optimization guides for Rust developers.',
      imagePath: 'assets/images/sofiaiq_cover.png',
      appStoreUrl: 'https://apps.apple.com/in/app/sofiaiq-rust/id6739019042',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.preciq.sofiaiqrust&pcampaignid=web_share'),
  ProjectData(
      title: 'Invi',
      subtitle: 'Mobile app version of Invi web platform',
      description:
          'Cross-platform mobile application providing seamless access to investment portfolio management, real-time market data, and financial planning tools.',
      imagePath: 'assets/images/invi_cover.png',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.ragory.invi.software&pcampaignid=web_share'),
  ProjectData(
      title: 'Invi Client',
      subtitle: 'For Business sub client',
      description:
          'Enterprise dashboard for business clients to manage investment accounts, track performance metrics, and access institutional-grade financial services.',
      imagePath: 'assets/images/invi_client_cover.png',
      appStoreUrl: 'https://apps.apple.com/in/app/invi-client/id6745792579',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.ragory.invi.client&pcampaignid=web_share'),
  ProjectData(
      title: 'Invi SR',
      subtitle: 'For Service Recipient sub client',
      description:
          'Specialized interface for service recipients to monitor investment progress, access personalized recommendations, and communicate with financial advisors.',
      imagePath: 'assets/images/invi_sr_cover.png',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.ragory.invi.sr&pcampaignid=web_share'),
  ProjectData(
      title: 'LSE',
      subtitle: 'Smart school management app',
      description:
          'Integrated school administration platform featuring student enrollment, grade management, attendance tracking, and parent-teacher communication tools.',
      imagePath: 'assets/images/school_cover.png',
      appStoreUrl:
          'https://apps.apple.com/in/app/london-school-of-english-lse/id6745716675',
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.ragory.lse&pcampaignid=web_share'),
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
        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 2,
        //   childAspectRatio: 1.45,
        //   crossAxisSpacing: 20,
        //   mainAxisSpacing: 20,
        // ),
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
