import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_portfolio/extension.dart';

class CreatedUsingFlutter extends StatelessWidget {
  const CreatedUsingFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Created using ',
          style: context.textStyles.bodyMdMedium
              .copyWith(fontSize: 12)
              .copyWith(color: context.colorScheme.onBackground),
        ),
        Gap(8),
        FlutterLogo(),
      ],
    );
  }
}
