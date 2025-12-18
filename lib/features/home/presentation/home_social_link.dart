import 'package:flutter/material.dart';

class HomeSocialLink extends StatelessWidget {
  const HomeSocialLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      // color: const Color(0xFF1A1A1A),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildContactSection(
            icon: Icons.location_on,
            title: 'Address',
            details: [
              'Mirpur 10',
              'Dhaka, Bangladesh',
            ],
          ),
          _buildContactSection(
            icon: Icons.phone,
            title: 'Phone',
            details: ['+8801300100574', '+8801409530856'],
          ),
          _buildContactSection(
            icon: Icons.email,
            title: 'Email',
            details: ['shafimunshi111@gmail.com', 'shafimunshi66@gmail.com'],
          ),
          _buildContactSection(
            icon: Icons.chat,
            title: 'Whatsapp',
            details: ['+8801300100574', ''],
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection({
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
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...details.map(
          (detail) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              detail,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
