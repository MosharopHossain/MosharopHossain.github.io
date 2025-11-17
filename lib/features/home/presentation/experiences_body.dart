import 'package:flutter/material.dart';
import 'package:my_portfolio/extension.dart';

class ExperiencesBody extends StatelessWidget {
  const ExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return DesktopExperiencesBody();
  }
}

class DesktopExperiencesBody extends StatelessWidget {
  const DesktopExperiencesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 3,
          height: 400,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                context.colorScheme.primary.withOpacity(0),
                context.colorScheme.primary,
                context.colorScheme.primary.withOpacity(0),
              ])),
        )
      ],
    );
  }
}

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            'Experience Title',
            style: context.textStyles.bodyLgBold
                .copyWith(color: context.colorScheme.onBackground),
          ),
          Text('Experience Description'),
        ],
      ),
    );
  }
}
