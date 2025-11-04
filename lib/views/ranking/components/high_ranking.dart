import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingHighRanking extends StatelessWidget {
  final int ranking;
  final Color backgroundColor;
  final String nickName;
  final String? userImage;
  final String? crown;
  final int puddingCounting;

  const PuddingHighRanking({
    super.key,
    required this.ranking,
    required this.backgroundColor,
    required this.nickName,
    required this.userImage,
    this.crown,
    required this.puddingCounting,
  });

  @override
  Widget build(BuildContext context) {
    final double puddingSize = ranking == 1 ? 60 : 45;
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              width: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: backgroundColor,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 11),
                child: SizedBox(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      Text('$ranking위', style: PuddingTextStyle.lotteriaChab),
                      const SizedBox(height: 12),
                      userImage != null
                          ? SvgPicture.asset(userImage!, width: 44, height: 44)
                          : SvgPicture.asset(
                              'assets/img/profile.svg',
                              width: 40,
                              height: 40,
                            ),
                      const SizedBox(height: 8),
                      Text(nickName, style: PuddingTextStyle.label1),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (crown != null)
              Positioned(
                bottom: 137,
                child: SvgPicture.asset(crown!, width: 64, height: 48),
              ),
            Positioned(
              top: 152,
              child: Padding(
                padding: EdgeInsets.only(
                  top: ranking == 1 ? 0 : 8,
                ),
                child: SvgPicture.asset(
                  'assets/img/pudding.svg',
                  width: puddingSize,
                  height: puddingSize,
                ),
              ),
            ),
            Positioned(
              top: 207,
              child: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  '$puddingCounting개',
                  style: PuddingTextStyle.heading3,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
