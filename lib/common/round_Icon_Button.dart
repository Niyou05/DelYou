
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double size;

  const RoundIconButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.color = const Color(0xFFFF9800),
    this.textColor = Colors.white,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Image.asset(
          icon,
          width: 20,
          height: 20,
        ),
        label: Text(title),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
