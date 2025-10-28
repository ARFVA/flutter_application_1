import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/ReusableTextButton.dart';

class ReusableDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String confirmText;
  final String cancelText;

  const ReusableDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.onCancel,
    this.confirmText = 'Ya',
    this.cancelText = 'Batal',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        ReusableTextButton(
          text: cancelText,
          onPressed: () {
            Navigator.of(context).pop();
            if (onCancel != null) onCancel!();
          },
          color: Colors.grey[200],
          textColor: Colors.black,
        ),
        ReusableTextButton(
          text: confirmText,
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          color: Colors.red,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
