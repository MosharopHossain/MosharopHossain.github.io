import 'package:flutter/material.dart';
import 'package:my_portfolio/extension.dart';
import 'package:my_portfolio/widgets/created_using_flutter.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final allChildren = [
      Text(
        '© 2024 Shafi Munshi\'s Portfolio. All rights reserved.',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      CreatedUsingFlutter(),
      SizedBox()
    ];
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: context.isMobile
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: allChildren,
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: allChildren,
            ),
    );
  }
}
