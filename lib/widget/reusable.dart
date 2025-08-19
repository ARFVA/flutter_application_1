import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  const CustomButton({
    this.backgroundColor = Colors.green,
    super.key,
    required this.text,
    this.textColor = Colors.white,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 16),
      ),
    );
  }
}
