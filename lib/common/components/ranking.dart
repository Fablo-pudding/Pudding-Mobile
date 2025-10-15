import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingRanking extends StatelessWidget {
  final int ranking;
  final String? userImage;
  final String userName;
  final int puddingCount;
  final Color backGroudColor;
  const PuddingRanking({
    super.key,
    required this.ranking,
     this.userImage,
    required this.userName,
    required this.puddingCount,
    required this.backGroudColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 18,horizontal: 20),
        color: backGroudColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(ranking.toString(), style: PuddingTextStyle.heading3),
                const SizedBox(width: 18),
                userImage != null ?  SvgPicture.asset(userImage!, width: 40, height: 40) : SvgPicture.asset('assets/img/profile.svg',width: 40,height: 40,),
                SizedBox(width: 12),
                Text(userName, style: PuddingTextStyle.heading3),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset('assets/img/pudding.svg', width: 40, height: 40),
                SizedBox(width: 8),
                Text('$puddingCount개',style: PuddingTextStyle.puddingCount,),
              ],
            ),
          ],
        ),
    );
  }
}
