import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const PuddingElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: ButtonBackgroundColor.background,
        foregroundColor: ButtonForegroundColor.foreground,
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

class ButtonBackgroundColor {
  static final WidgetStateProperty<Color> background =
      WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) return PuddingColor.gray200;
        if (states.contains(WidgetState.pressed)) return PuddingColor.yellow;
        return PuddingColor.main;
      });
}

class ButtonForegroundColor {
  static final WidgetStateProperty<Color> foreground =
      WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.disabled)) return PuddingColor.white;
        if (states.contains(WidgetState.pressed)) return PuddingColor.brown;
        return PuddingColor.brown;
      });
}
