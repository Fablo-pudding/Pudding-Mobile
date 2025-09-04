import 'package:flutter/material.dart';
import 'package:pudding/core/constants/color.dart';
import 'package:pudding/core/constants/text_style.dart';

class FullButton extends StatelessWidget {
  const FullButton({super.key,required this.text});
final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PuddingColor.gray200,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 362,
      height: 48,
        child: Center(child: Text(text,style: PuddingTextStyle.button,)),
    );
  }
}
