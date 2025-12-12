import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/style/app_colors.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class ProjectData {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;

  const ProjectData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
  });
}

class WorkItem extends StatefulWidget {
  final ProjectData projectData;
  final int index;

  const WorkItem({super.key, required this.projectData, required this.index});

  @override
  State<WorkItem> createState() => _WorkItemState();
}

class _WorkItemState extends State<WorkItem>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _animationController;
  late Animation<double> _blurAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _blurAnimation = Tween<double>(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
        _animationController.forward();
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
        _animationController.reverse();
      },
      child: AnimatedBuilder(
        animation: _blurAnimation,
        builder: (context, child) {
          return Card(
            elevation: _isHovered ? 8 : 2,
            margin: EdgeInsets.only(bottom: 20),
            color: Colors.transparent,
            child: context.isDesktopOrTablet
                ? _workItemDesktop(context, widget.index)
                : _workItemMobile(context),
          );
        },
      ),
    );
  }

  Column _workItemMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: context.width - 100,
          height: 110 * ((context.width - 100) / 200),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: AnimatedBuilder(
              animation: _blurAnimation,
              builder: (context, child) {
                return ImageFiltered(
                  imageFilter: ImageFilter.blur(
                    sigmaX: _blurAnimation.value,
                    sigmaY: _blurAnimation.value,
                  ),
                  child: Image.asset(
                    widget.projectData.imagePath,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SeoTexts(
                text: widget.projectData.title,
                style: context.textStyles.bodyLgBold
                    .copyWith(color: context.colorScheme.onBackground),
                textRendererStyle: TextRendererStyle.header4,
                textAlign: TextAlign.left,
              ),
              Gap(8),
              SeoTexts(
                text: widget.projectData.description,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.bodyMdMedium
                    .copyWith(color: context.colorScheme.onSurface),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _workItemDesktop(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (index % 2 == 0) ...[
          _coverAppImg(),
        ],
        _allTextData(context),
        if (index % 2 != 0) ...[
          _coverAppImg(),
        ],
      ],
    );
  }

  Container _allTextData(BuildContext context) {
    return Container(
      // flex: 1,
      width: context.width - 1300,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SeoTexts(
                  text: widget.projectData.title,
                  style: context.textStyles.titleLgBold.copyWith(
                    color: Colors.amber,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                    fontSize: 24,
                    fontFamily: GoogleFonts.merienda().fontFamily,
                  ),
                  textRendererStyle: TextRendererStyle.header3,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text('Android & IOS'),
                )
              ],
            ),
            Gap(10),
            SeoTexts(
              text: widget.projectData.subtitle,
              style: context.textStyles.titleLgBold.copyWith(
                color: context.colorScheme.onBackground,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.0,
                fontSize: 22,
                fontFamily: GoogleFonts.merienda().fontFamily,
              ),
              textRendererStyle: TextRendererStyle.header3,
            ),
            Gap(5),
            SeoTexts(
              text: widget.projectData.description,
              maxLines: 6,
              style: context.textStyles.bodySmRegular.copyWith(
                color: AppColors.grey[200],
                letterSpacing: 1.0,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12,
              ),
              textRendererStyle: TextRendererStyle.header3,
            ),
            Gap(20),
            Row(
              spacing: 20,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: AppColors.white))),
                  onPressed: () {},
                  child: Text(
                    '▶️ Watch Video',
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: AppColors.white))),
                  onPressed: () {},
                  child: Text(
                    'Play Store',
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: AppColors.white))),
                  onPressed: () {},
                  child: Text(
                    'App Store',
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: AppColors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _coverAppImg() {
    return SizedBox(
      // flex: 1,
      height: 300,
      width: 450,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: AnimatedBuilder(
          animation: _blurAnimation,
          builder: (context, child) {
            return ImageFiltered(
              imageFilter: ImageFilter.blur(
                sigmaX: _blurAnimation.value,
                sigmaY: _blurAnimation.value,
              ),
              child: Container(
                width: double.infinity,
                child: Image.asset(
                  widget.projectData.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
