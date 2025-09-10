import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingAppBar extends StatelessWidget{
  final Widget? leftWidget;
  final String title;
  final TextStyle? titleStyle;
  final Widget? rightWidget;

  const PuddingAppBar({
    super.key,
    this.leftWidget,
    required this.title,
    this.titleStyle,
    this.rightWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 54),
      child: SizedBox(
        height: 44,
        child: Row(
          children: [
            leftWidget ?? const SizedBox(width: 24),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: titleStyle ?? PuddingTextStyle.lotteriaChab.copyWith(color: PuddingColor.brown),
                ),
              ),
            ),
            rightWidget ?? const SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}