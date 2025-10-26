import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingMenu extends StatelessWidget {
  final String menuName;
  final Icon? iconButton;
  final BorderRadius? borderRadius;
  final Color textColor;

  const PuddingMenu({
    super.key,
    required this.menuName,
    this.iconButton,
    this.borderRadius,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: BoxDecoration(
        color: PuddingColor.main,
        borderRadius: borderRadius,
      ),
      width: double.infinity,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            menuName,
            style: PuddingTextStyle.heading2.copyWith(color: textColor),
          ),
          //Todo 눌렀을때 다른 페이지 연결하기
          if (iconButton != null)
            IconButton(
              iconSize: 16,
              onPressed: () {},
              icon: iconButton!,
              color: PuddingColor.gray400,
              padding: EdgeInsets.zero,
            ),
        ],
      ),
    );
  }
}
