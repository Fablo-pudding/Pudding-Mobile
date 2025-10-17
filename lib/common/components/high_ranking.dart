import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingHighRangking extends StatelessWidget {
  final int ranking;
  final Color backgroundColor;
  final String nickName;
  final String userImage;
  final String? crown;
  final int puddingCounting;

  const PuddingHighRangking({
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
    final double puddingSize;
    if(ranking == 1){
      puddingSize = 60;
    }
    else{
      puddingSize = 45;
    }
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
                padding: EdgeInsets.only(
                  left: 11,
                  right: 11,
                  top: 10,
                  bottom: 23,
                ),
                child: Column(
                  children: [
                    Text('$ranking개', style: PuddingTextStyle.lotteriaChab),
                    SizedBox(height: 12),
                    SvgPicture.asset(userImage, width: 44, height: 44),
                    SizedBox(height: 7),
                    Text(nickName, style: PuddingTextStyle.label1),
                  ],
                ),
              ),
            ),
            if(crown != null)
              Positioned(
                bottom: 148,
                child: SvgPicture.asset(crown!,width: 64,height: 48,),
              ),
            Positioned(
                top: 140,
                child: Padding(
                  padding:  EdgeInsets.only(top: ranking == 1 ? 0 : ranking == 2 ? 8 : 8),
                  child: SvgPicture.asset('assets/img/pudding.svg',width: puddingSize,height: puddingSize,),
                )),
            Positioned(
              top: 195,
              child: Padding(
                padding: EdgeInsets.only(top: ranking == 1 ? 4 : ranking == 2 ? 4 : 4),
                child: Text('$puddingCounting개',style: PuddingTextStyle.heading3),
              ),)
          ],
        ),
      ],
    );
  }
}