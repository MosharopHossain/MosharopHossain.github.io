import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';
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

  const WorkItem({super.key, required this.projectData});

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
    _blurAnimation = Tween<double>(begin: 0.0, end: 2.0).animate(
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
            color: context.colorScheme.surfaceVariant,
            child: context.isDesktopOrTablet
                ? _workItemDesktop(context)
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

  Widget _workItemDesktop(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
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
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SeoTexts(
                        text: widget.projectData.title,
                        style: context.textStyles.titleLgBold.copyWith(
                          color: context.colorScheme.onBackground,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.0,
                          fontSize: 18,
                        ),
                        textRendererStyle: TextRendererStyle.header3,
                      ),
                      Gap(6),
                      Flexible(
                        child: SeoTexts(
                          text: widget.projectData.description,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: context.textStyles.bodyMdMedium.copyWith(
                            color:
                                context.colorScheme.onSurface.withOpacity(0.7),
                            height: 1.3,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: context.colorScheme.onBackground,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Figma To Webflow',
                      style: context.textStyles.bodySmRegular.copyWith(
                        color: context.colorScheme.onBackground,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
