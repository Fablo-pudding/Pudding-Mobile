import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/feed/presentation/feed_preview.dart';

class PuddingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final String title;
  final TextStyle? titleStyle;
  final String? leftText;
  final String? rightText;
  final void Function()? navigator;

  const PuddingAppBar({
    super.key,
    this.leading,
    required this.title,
    this.titleStyle,
    this.leftText,
    this.rightText,
    this.navigator,
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
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (leftText != null)
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    leftText!,
                    style: PuddingTextStyle.heading3.copyWith(
                      color: PuddingColor.gray400,
                    ),
                  ),
                ),
              Expanded(
                child: Text(
                  title,
                  style:
                      titleStyle ??
                      PuddingTextStyle.lotteriaChab.copyWith(
                        color: PuddingColor.brown,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              if (rightText != null)
                TextButton(
                  onPressed: () {
                    if(navigator != null) {
                      navigator!();
                    }
                  },
                  child: Text(
                    rightText!,
                    style: PuddingTextStyle.heading3,
                  ),
                ),
            ],
          ),
        leading: leading,
        leadingWidth: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
