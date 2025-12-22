import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:flutter_svg/svg.dart';

class ItemModal extends StatelessWidget {

  const ItemModal({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: PuddingColor.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(const Radius.circular(8)),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Text(
              '재료를 사용하여 푸딩을 만드시겠습니까?',
              style: PuddingTextStyle.heading3.copyWith(
                color: PuddingColor.brown,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Divider(color: PuddingColor.gray400, thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
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
