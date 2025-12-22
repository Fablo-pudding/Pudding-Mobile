import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/constants/text_style.dart';

class UpgradeModal extends StatelessWidget {
  const UpgradeModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: PuddingColor.gray400.withValues(alpha: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: PuddingUpgradeBox(
                    svgPicture: PuddingAssets.pudding2,
                    star: '1성',
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: PuddingUpgradeBox(
                    svgPicture: PuddingAssets.pudding3,
                    star: '2성',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: PuddingElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('취소'),
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}

class PuddingUpgradeBox extends StatelessWidget {
  final String svgPicture;
  final String star;

  const PuddingUpgradeBox({
    super.key,
    required this.svgPicture,
    required this.star,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        /// todo
      },
      child: Container(
        decoration: BoxDecoration(
          color: PuddingColor.background,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 240,
        width: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(svgPicture,fit: BoxFit.fill,width: 64,height: 64,),
            const SizedBox(
              height: 12,
            ),
            Text(star,style: PuddingTextStyle.feedTitle,),
          ],
        ),
      ),
    );
  }
}
