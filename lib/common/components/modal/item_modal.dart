import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:flutter_svg/svg.dart';

class ItemModal extends StatelessWidget {
  final String svgPath;

  const ItemModal({
    super.key,
    required this.svgPath
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: PuddingColor.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Text(
              '아이템을 획득하였습니다.',
              style: PuddingTextStyle.heading3.copyWith(
                color: PuddingColor.brown,
              ),
            ),
          ),
          SvgPicture.asset(svgPath),
          const SizedBox(height: 20),
          const Divider(color: PuddingColor.gray400, thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Text(
                '확인',
                style: PuddingTextStyle.body1.copyWith(
                  color: PuddingColor.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
