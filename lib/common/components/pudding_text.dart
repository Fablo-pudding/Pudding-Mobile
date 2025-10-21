import 'package:flutter/material.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingText extends StatelessWidget {
  const PuddingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Pudding',
      style: PuddingTextStyle.lotteriaChab.copyWith(fontSize: 36),
    );
  }
}
