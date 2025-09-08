
import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingElevatedButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const PuddingElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final buttonBackgroundColor =
        WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) return PuddingColor.gray200;
          if (states.contains(WidgetState.pressed)) return PuddingColor.yellow;
          return PuddingColor.main;
        });
    final buttonForegroundColor =
        WidgetStateProperty.resolveWith<Color>((states) {
          if (states.contains(WidgetState.disabled)) return PuddingColor.white;
          if (states.contains(WidgetState.pressed)) return  PuddingColor.brown;
          return PuddingColor.brown;
        });
    
  return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: buttonBackgroundColor,
        foregroundColor: buttonForegroundColor,
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        textStyle: WidgetStateProperty.all(PuddingTextStyle.button),
        minimumSize: WidgetStateProperty.all(Size(80, 48)),
      ),
      child: Text(text),
    );
  }
}
