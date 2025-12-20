import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/constants/text_style.dart';

enum PuddingBox{
  firstPudding,
  secondPudding,
  thirdPudding;

}
class PuddingStar extends StatefulWidget {
  final int? star;
  final int puddingCount;
  final int puddingCount2;
  final int puddingCount3;

  const PuddingStar({
    super.key,
    this.star,
    required this.puddingCount,
    required this.puddingCount2,
    required this.puddingCount3,
  });

  @override
  State<PuddingStar> createState() => _PuddingStarState();
}

class _PuddingStarState extends State<PuddingStar> {
  late PuddingBox stars;
@override
  void initState() {
    super.initState();
    stars = PuddingBox.firstPudding;
  }

  Widget _buildStarColumn() {
    switch (stars) {
      case PuddingBox.firstPudding:
        return Center(
          child: Column(
            children: [
              SvgPicture.asset(PuddingAssets.star1),
              SvgPicture.asset(PuddingAssets.pudding1),
              const SizedBox(height: 4),
              Text('${widget.puddingCount}개',
                  style: PuddingTextStyle.puddingCount),
            ],
          ),
        );
      case PuddingBox.secondPudding:
        return Center(
          child: Column(
            children: [
              SvgPicture.asset(PuddingAssets.star2),
              SvgPicture.asset(PuddingAssets.pudding2),
              const SizedBox(height: 4),
              Text('${widget.puddingCount2}개',
                  style: PuddingTextStyle.puddingCount),
            ],
          ),
        );
      case PuddingBox.thirdPudding:
        return Center(
          child: Column(
            children: [
              SvgPicture.asset(PuddingAssets.star3),
              SvgPicture.asset(PuddingAssets.pudding3),
              const SizedBox(height: 4),
              Text('${widget.puddingCount3}개',
                  style: PuddingTextStyle.puddingCount),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: PuddingColor.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: PuddingColor.brown, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
               switch(stars){
                 case PuddingBox.firstPudding:
                   stars = PuddingBox.thirdPudding;
                 case PuddingBox.secondPudding:
                   stars = PuddingBox.firstPudding;
                 case PuddingBox.thirdPudding:
                  stars = PuddingBox.secondPudding;
               }
              });
            },
            child: Icon(
              Symbols.arrow_back_ios,
              size: 16,
              color: PuddingColor.brown,
            ),
          ),
          Expanded(child: _buildStarColumn()),
          GestureDetector(
            onTap: () {
              setState(() {
                switch(stars){
                  case PuddingBox.secondPudding:
                    stars = PuddingBox.thirdPudding;
                  case PuddingBox.thirdPudding:
                    stars = PuddingBox.firstPudding;
                  case PuddingBox.firstPudding:

                }
              });
            },
            child: Icon(
              Symbols.arrow_forward_ios,
              size: 16,
              color: PuddingColor.brown,
            ),
          ),
        ],
      ),
    );
  }
}