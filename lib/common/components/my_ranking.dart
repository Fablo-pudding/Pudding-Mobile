import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingMyRanking extends StatelessWidget {
  final int ranking;
  final String userImage;
  final String userName;
  final String puddingImage;
  final int puddingCount;

  const PuddingMyRanking({
    super.key,
    required this.ranking,
    required this.userImage,
    required this.userName,
    required this.puddingCount,
    required this.puddingImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(color: PuddingColor.lightYellow),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(ranking.toString(), style: PuddingTextStyle.heading3),
              SizedBox(width: 18),
              SvgPicture.asset(userImage, width: 40, height: 40),
              SizedBox(width: 12),
              Text(userName, style: PuddingTextStyle.heading3),
            ],
          ),
          Row(
            children: [
              SvgPicture.asset(puddingImage, width: 40, height: 40),
              SizedBox(width: 8),
              Text(
                '$puddingCount개'.toString(),
                style: PuddingTextStyle.heading3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
