import 'package:flutter/cupertino.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingMyPageRanking extends StatelessWidget {
  final int ranking;
  const PuddingMyPageRanking({super.key, 
    required this.ranking});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 18,horizontal: 24),
        decoration: BoxDecoration(
          color: PuddingColor.main,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('👑랭킹',style: PuddingTextStyle.heading2,),
              Text('$ranking개', style: PuddingTextStyle.heading2,),
            ],
          ),
        ),
    );
  }
}
