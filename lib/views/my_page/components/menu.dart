import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingMenu extends StatelessWidget {
  final String menuName;
  final Widget? icon;
  final BorderRadius? borderRadius;
  final Color textColor;
  final void Function()? onTap;

  const PuddingMenu({
    super.key,
    required this.menuName,
    this.icon,
    this.borderRadius,
    required this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
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
          if (icon != null)
            IconButton(
              iconSize: 16,
              onPressed: onTap,
              icon: icon!,
              color: PuddingColor.gray400,
              padding: EdgeInsets.zero,
            ),
        ],
      ),
    );
  }
}
