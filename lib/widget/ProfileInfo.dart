import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String title;
  final String value;

  const ProfileInfo({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
