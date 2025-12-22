import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingIngredientsItem extends StatelessWidget {
  final String svgPicture;
  final int ingredientsItem;
  final double width;
  final double height;
  final double? svgHeight;

  const PuddingIngredientsItem({
    super.key,
    required this.svgPicture,
    required this.ingredientsItem,
    required this.width,
    required this.height,
    this.svgHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: PuddingColor.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PuddingColor.brown, width: 2),
      ),
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$ingredientsItem개',
            style: PuddingTextStyle.ingredientsItem,
          ),
          SvgPicture.asset(
            svgPicture,
            fit: BoxFit.contain,
            height: svgHeight,
          ),
        ],
      ),
    );
  }
}
