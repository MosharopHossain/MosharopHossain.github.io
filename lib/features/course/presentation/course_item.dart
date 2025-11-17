import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AspectRatio(
        aspectRatio: .7,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                child: Image.network('https://picsum.photos/200',
                    fit: BoxFit.cover),
              ),
            ),
            Gap(24),
            SeoTexts(
              text: 'random text',
              style: context.textStyles.bodyLgBold
                  .copyWith(color: context.colorScheme.onBackground),
              textRendererStyle: TextRendererStyle.header4,
            ),
            Gap(8),
            Expanded(
                child: SeoTexts(
              text: 'Some description here',
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.bodyMdMedium
                  .copyWith(color: context.colorScheme.onSurface),
            )),
          ],
        ),
      ),
    );
  }
}
