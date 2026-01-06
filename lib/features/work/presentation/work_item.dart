import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/style/app_colors.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ProjectData {
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final String? videoUrl;
  final String? playStoreUrl;
  final String? appStoreUrl;

  const ProjectData({
    this.videoUrl,
    this.playStoreUrl,
    this.appStoreUrl,
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
            child: context.isDesktop
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
          width: context.width - 40,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
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
                    width: double.infinity,
                  ),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SeoTexts(
                      text: widget.projectData.title,
                      style: context.textStyles.titleSmBold.copyWith(
                        color: Colors.amber,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.8,
                        fontSize: 20,
                        fontFamily: GoogleFonts.merienda().fontFamily,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      (widget.projectData.playStoreUrl != null
                              ? 'Android'
                              : '') +
                          (widget.projectData.appStoreUrl != null
                              ? ' & IOS'
                              : ''),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Gap(8),
              SeoTexts(
                text: widget.projectData.subtitle,
                style: context.textStyles.titleSmBold.copyWith(
                  color: context.colorScheme.onBackground,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 0.8,
                  fontSize: 16,
                  fontFamily: GoogleFonts.merienda().fontFamily,
                ),
              ),
              Gap(8),
              SeoTexts(
                text: widget.projectData.description,
                maxLines: 5,
                style: context.textStyles.bodySmRegular.copyWith(
                  color: AppColors.grey[200],
                  letterSpacing: 0.8,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 11,
                  height: 1.4,
                ),
              ),
              Gap(16),
              Wrap(
                spacing: 12,
                runSpacing: 8,
                children: [
                  if (widget.projectData.videoUrl != null)
                    SizedBox(
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: AppColors.white, width: 1),
                          ),
                        ),
                        onPressed: () {
                          launchUrlString(widget.projectData.videoUrl!);
                        },
                        child: Text(
                          '▶️ Watch Video',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: AppColors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  if (widget.projectData.playStoreUrl != null)
                    SizedBox(
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: AppColors.white, width: 1),
                          ),
                        ),
                        onPressed: () {
                          launchUrlString(widget.projectData.playStoreUrl!);
                        },
                        child: Text(
                          'Play Store',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: AppColors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  if (widget.projectData.appStoreUrl != null)
                    SizedBox(
                      height: 32,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(color: AppColors.white, width: 1),
                          ),
                        ),
                        onPressed: () {
                          launchUrlString(widget.projectData.appStoreUrl!);
                        },
                        child: Text(
                          'App Store',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: AppColors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    )
                ],
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
        _allTextDataForDesktop(context),
        if (index % 2 != 0) ...[
          _coverAppImg(),
        ],
      ],
    );
  }

  Container _allTextDataForDesktop(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 600,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text((widget.projectData.playStoreUrl != null
                          ? 'Android'
                          : '') +
                      (widget.projectData.appStoreUrl != null ? ' & IOS' : '')),
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
            ),
            Gap(20),
            Row(
              spacing: 20,
              children: [
                if (widget.projectData.videoUrl != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: AppColors.white))),
                    onPressed: () {
                      // Launch video URL
                      launchUrlString(widget.projectData.videoUrl!);
                    },
                    child: Text(
                      '▶️ Watch Video',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                if (widget.projectData.playStoreUrl != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: AppColors.white))),
                    onPressed: () {
                      // Launch Play Store URL
                      launchUrlString(widget.projectData.playStoreUrl!);
                    },
                    child: Text(
                      'Play Store',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: AppColors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                if (widget.projectData.appStoreUrl != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: BorderSide(color: AppColors.white))),
                    onPressed: () {
                      // Launch App Store URL
                      launchUrlString(widget.projectData.appStoreUrl!);
                    },
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

  ConstrainedBox _coverAppImg() {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: context.width > 1210 ? 450 : 300,
          minWidth: context.width > 1210 ? 300 : 200,
          maxHeight: 300,
          minHeight: 200),
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
