import 'package:flutter/material.dart';
import 'package:my_portfolio/extension.dart';

class HomeTitleSubtitle extends StatelessWidget {
  const HomeTitleSubtitle({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          
        ],
      ),
    );
  }
}
