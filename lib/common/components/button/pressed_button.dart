import 'package:flutter/material.dart';
import '../../constants/color.dart';
import '../../constants/text_style.dart';


class PressedButton extends StatelessWidget {
  const PressedButton({super.key,required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xffECDB90),
        borderRadius: BorderRadius.circular(8),
      ),
      width: 362,
      height: 48,
      child: Center(child: Text(text,style: PuddingTextStyle.button)),
    );
  }
}
