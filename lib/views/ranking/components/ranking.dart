import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingRanking extends StatelessWidget {
  final int ranking;
  final String? userImage;
  final String userName;
  final int puddingCount;
  final Color backgroudColor;

  const PuddingRanking({
    super.key,
    required this.ranking,
    this.userImage,
    required this.userName,
    required this.puddingCount,
    required this.backgroudColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      color: backgroudColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(ranking.toString(), style: PuddingTextStyle.heading3),
              const SizedBox(width: 18),
              userImage != null
                  ? SvgPicture.asset(userImage!, width: 40, height: 40)
                  : SvgPicture.asset(
                      PuddingAssets.profile,
                      width: 40,
                      height: 40,
                    ),
              const SizedBox(width: 12),
              Text(userName, style: PuddingTextStyle.heading3),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(PuddingAssets.pudding, width: 40, height: 40),
              const SizedBox(width: 8),
              Text('$puddingCount개', style: PuddingTextStyle.puddingCount),
            ],
          ),
        ],
      ),
    );
  }
}
