import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/created_using_flutter.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '© 2024 Shafi Munshi\'s Portfolio. All rights reserved.',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          CreatedUsingFlutter(),
          SizedBox()
        ],
      ),
    );
  }
}
