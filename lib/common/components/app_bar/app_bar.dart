import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final TextStyle? titleStyle;

  const PuddingAppBar({
    super.key,
    this.leading,
    required this.title,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0,
        backgroundColor: PuddingColor.background,
        elevation: 0,
        title: Text(
          title,
          style:
              titleStyle ??
              PuddingTextStyle.lotteriaChab.copyWith(color: PuddingColor.brown),
        ),
        leading: leading,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
