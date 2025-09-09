import 'package:flutter/material.dart';
import 'package:pudding/common//constants/color.dart';
import 'package:pudding/common//constants/text_style.dart';

class CheckModal extends StatelessWidget {
  final String message;
  final String subMessage;
  final Widget checkLeft;
  final Widget checkRight;
  final VoidCallback onLeftTap;
  final VoidCallback onRightTap;

  const CheckModal({
    super.key,
    required this.message,
    required this.subMessage,
    required this.checkLeft,
    required this.checkRight,
    required this.onLeftTap,
    required this.onRightTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: PuddingColor.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Text(
            message,
            style: PuddingTextStyle.heading2.copyWith(
              color: PuddingColor.black,
            ),
          ),
          Text(
            subMessage,
            style: PuddingTextStyle.body1.copyWith(color: PuddingColor.gray400),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(onTap: onLeftTap, child: checkLeft),
                GestureDetector(onTap: onRightTap, child: checkRight),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
