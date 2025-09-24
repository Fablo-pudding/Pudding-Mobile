import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class IngredientItem extends StatelessWidget {
  final String imgPath;
  final int count;

  const IngredientItem({
    super.key,
    required this.imgPath,
    required this.count
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(imgPath, width: 100, height: 100),
        Container(
          width: 100,
          height: 32,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: PuddingColor.brown, width: 1)),
          child: Align(alignment: Alignment.center, child: Text('$count', style: PuddingTextStyle.heading3.copyWith(color: PuddingColor.brown))),
        ),
      ],
    );
  }
}
