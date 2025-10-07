import 'package:flutter/material.dart';

class ReusableProfileCard extends StatelessWidget {
  final String imagePath;
  final List<Widget> infoWidgets;
  final Widget? actionWidget;

  const ReusableProfileCard({
    super.key,
    required this.imagePath,
    required this.infoWidgets,
    this.actionWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 3,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(imagePath),
              ),
            ),
            const SizedBox(height: 20),
            ...infoWidgets,
            if (actionWidget != null) ...[
              const SizedBox(height: 16),
              actionWidget!,
            ],
          ],
        ),
      ),
    );
  }
}
