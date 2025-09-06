import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class CoustomElevatedButton extends StatelessWidget {
  const CoustomElevatedButton({
    super.key,
    required this.text,
    required this.height,
    required this.onPressed,
  });

  final String text;
  final double height;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return PuddingColor.gray200;
          }
          if (states.contains(WidgetState.pressed)) {
            return Color(0xffECDB90);
          }
          return PuddingColor.main;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) {
            return Colors.white;
          }
          if (states.contains(WidgetState.pressed)) {
            return Colors.brown;
          }
          return Colors.brown;
        }),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        textStyle: WidgetStateProperty.all(PuddingTextStyle.button),
        minimumSize: WidgetStateProperty.all(Size(double.infinity, height)),
      ),
      child: Text(text),
    );
  }
}
