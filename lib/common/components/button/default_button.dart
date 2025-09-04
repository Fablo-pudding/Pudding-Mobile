import 'package:flutter/material.dart';
import '../../constants/color.dart';
import '../../constants/text_style.dart';


class DefaultButton extends StatelessWidget {
  const DefaultButton ({super.key,required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PuddingColor.main,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 362,
      height: 48,
      child: Center(child: Text(text,style: PuddingTextStyle.button)),
    );
  }
}
