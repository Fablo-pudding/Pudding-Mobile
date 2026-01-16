import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final Widget? rightText;

  const PuddingAppBar({
    super.key,
    this.leading,
    required this.title,
    this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: PuddingColor.background,
        elevation: 0,
        centerTitle: true,
        leading: leading != null
            ? Align(
                alignment: Alignment.centerLeft,
                child: leading,
              )
            : const SizedBox(width: 70),
        title: Text(
          title,
          style: PuddingTextStyle.lotteriaChab.copyWith(
            color: PuddingColor.brown,
          ),
        ),
        actions: [
          rightText != null
              ? Align(
                  alignment: Alignment.centerRight,
                  child: rightText,
                )
              : const SizedBox(width: 70),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
