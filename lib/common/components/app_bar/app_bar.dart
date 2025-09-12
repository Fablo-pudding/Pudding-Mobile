import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leftWidget;
  final String title;
  final TextStyle? titleStyle;
  final bool saveButton;
  final VoidCallback? onSave;

  const PuddingAppBar({
    super.key,
    this.leftWidget,
    required this.title,
    this.titleStyle,
    this.saveButton = false,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: PuddingColor.background,
      elevation: 0,
      title: Text(
        title,
        style: titleStyle ?? PuddingTextStyle.lotteriaChab.copyWith(color: PuddingColor.brown),
      ),
      leading: leftWidget ?? const SizedBox(width: 24),
      actions: saveButton
          ? [
        TextButton(
          onPressed: onSave,
          child: Text(
            '저장',
            style: PuddingTextStyle.heading3.copyWith(color: PuddingColor.brown),
          ),
        )
      ]
          : [const SizedBox(width: 24)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}