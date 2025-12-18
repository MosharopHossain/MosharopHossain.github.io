import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/features/home/presentation/home_description.dart';
import 'package:my_portfolio/style/app_colors.dart';
import 'package:my_portfolio/widgets/seo_texts.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';

class HomeToolList extends StatelessWidget {
  const HomeToolList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: context.insets.padding,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(
              color: context.colorScheme.onBackground,
              width: 2,
            ),
          ),
          child: SeoTexts(
            text: 'Tools & Technologies',
            style: context.textStyles.titleSmBold.copyWith(
              color: Colors.white70,
            ),
            textRendererStyle: TextRendererStyle.header3,
          ),
        ),
        const Gap(10),
        Wrap(
          runAlignment: WrapAlignment.spaceEvenly,
          spacing: 12,
          // runSpacing: 8,
          children: const [
            Chip(
                label: Text(
                  'Flutter',
                  style: TextStyle(color: Colors.white),
                ),
                color: WidgetStatePropertyAll(Colors.blue)),
            Chip(label: Text('Axum')),
            Chip(label: Text('Firebase')),
            Chip(label: Text('Supabase')),
            Chip(label: Text('Git')),
            Chip(label: Text('REST APIs')),
            Chip(label: Text('GraphQL')),
            Chip(label: Text('SQLite')),
            Chip(label: Text('Isar')),
            Chip(label: Text('PostgreSQL')),
          ],
        ),
        const HomeDescription(),
      ],
    );
  }
}
