import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingRestRanking extends StatelessWidget {
  final int ranking;
  final String userImage;
  final String userName;
  final int puddingCount;

  const PuddingRestRanking({
    super.key,
    required this.ranking,
    required this.userImage,
    required this.userName,
    required this.puddingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            SvgPicture.asset('assets/img/pudding.svg', width: 40, height: 40),
            SizedBox(width: 8),
            Text('$puddingCount개',style: PuddingTextStyle.puddingCount,),
          ],
        ),
      ],
    );
  }
}
