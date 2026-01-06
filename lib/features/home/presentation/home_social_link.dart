import 'package:flutter/material.dart';
import 'package:my_portfolio/extension.dart';

class HomeSocialLink extends StatelessWidget {
  const HomeSocialLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.isDesktop ? 24 : 16,
        vertical: context.isDesktop ? 24 : 20,
      ),
      child: _buildResponsiveLayout(context),
    );
  }

  Widget _buildResponsiveLayout(BuildContext context) {
    final contactSections = [
      _buildContactSection(
        context: context,
        icon: Icons.location_on,
        title: 'Address',
        details: [
          'Mirpur 10',
          'Dhaka, Bangladesh',
        ],
      ),
      _buildContactSection(
        context: context,
        icon: Icons.phone,
        title: 'Phone',
        details: ['+8801300100574', '+8801409530856'],
      ),
      _buildContactSection(
        context: context,
        icon: Icons.email,
        title: 'Email',
        details: ['shafimunshi111@gmail.com', 'shafimunshi66@gmail.com'],
      ),
      _buildContactSection(
        context: context,
        icon: Icons.chat,
        title: 'Whatsapp',
        details: ['+8801300100574', ''],
      ),
    ];

    // Desktop layout - Row
    if (context.isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: contactSections,
      );
    }
    // Tablet layout - 2x2 Grid
    else if (context.width > 600) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              contactSections[0],
              const SizedBox(width: 20),
              contactSections[1],
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              contactSections[2],
              const SizedBox(width: 20),
              contactSections[3],
            ],
          ),
        ],
      );
    }
    // Mobile layout - Column
    else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: contactSections
            .map((section) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: section,
                ))
            .toList(),
      );
    }
  }

  Widget _buildContactSection({
    required BuildContext context,
    required IconData icon,
    required String title,
    required List<String> details,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.green,
              size: context.isDesktop ? 20 : 18,
            ),
            SizedBox(width: context.isDesktop ? 8 : 6),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: context.isDesktop ? 13 : 12,
              ),
            ),
          ],
        ),
        SizedBox(height: context.isDesktop ? 8 : 6),
        ...details.where((detail) => detail.isNotEmpty).map(
              (detail) => Padding(
                padding: EdgeInsets.only(bottom: context.isDesktop ? 4 : 2),
                child: Text(
                  detail,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: context.isDesktop ? 14 : 12,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
      ],
    );
  }
}
