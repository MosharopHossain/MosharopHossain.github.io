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
        FlutterLogo(),
        Gap(8),
        Text(
          context.texts.cooperationRequest,
          style: context.textStyles.bodyMdMedium
              .copyWith(color: context.colorScheme.onBackground),
        )
      ],
    );
  }
}
