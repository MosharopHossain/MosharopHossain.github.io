import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class WorkItem extends StatelessWidget {
  const WorkItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.colorScheme.surfaceVariant,
      child: context.isDesktopOrTablet
          ? _workItemDesktop(context)
          : _workItemMobile(context),
    );
  }

  Column _workItemMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: context.width - 100,
          height: 80 * ((context.width - 100) / 200),
          child: Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child:
                  Image.network('https://picsum.photos/200', fit: BoxFit.cover),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SeoTexts(
                text: 'random text',
                style: context.textStyles.bodyLgBold
                    .copyWith(color: context.colorScheme.onBackground),
                textRendererStyle: TextRendererStyle.header4,
                textAlign: TextAlign.left,
              ),
              Gap(8),
              SeoTexts(
                text: 'Some description here',
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

  Row _workItemDesktop(BuildContext context) {
    return Row(
      children: [
        LayoutBuilder(builder: (context, constraints) {
          log('MaxWidth: ${constraints.maxWidth}');
          return SizedBox(
            width: context.width > 800 ? 350 : 200,
            child: Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network('https://picsum.photos/200',
                    fit: BoxFit.cover),
              ),
            ),
          );
        }),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SeoTexts(
                text: 'random text',
                style: context.textStyles.bodyLgBold
                    .copyWith(color: context.colorScheme.onBackground),
                textRendererStyle: TextRendererStyle.header4,
              ),
              Gap(8),
              SeoTexts(
                text: 'Some description here',
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
}
