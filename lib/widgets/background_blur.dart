import 'package:flutter/material.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/style/app_size.dart';

class BackgroundBlur extends StatelessWidget {
  const BackgroundBlur({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: -(context.width / 2 / 2),
      right: (-(context.width / 2 / 2)) + Insets.xxxl,
      child: Container(
        width: context.width / 2,
        height: context.width / 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // color: context.colorScheme.primary.withOpacity(0.3),
          boxShadow: [
            BoxShadow(
              color: context.colorScheme.primary.withOpacity(0.4),
              blurRadius: 200,
              spreadRadius: 100,
            ),
          ],
        ),
      ),
    );
  }
}
