import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/constants/color.dart';

class PuddingGenderButton extends StatefulWidget {
  final String image;
  final void Function() onTap;
  const PuddingGenderButton({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  State<PuddingGenderButton> createState() => _PuddingGenderButtonState();
}

class _PuddingGenderButtonState extends State<PuddingGenderButton> {
   bool manSelected = false;
   bool womanSelcted = false;

   void manselted(){
     setState(() {
       manSelected = true;
       womanSelcted = false;
       widget.onTap();
     });
}

   void girlselted(){
     setState(() {
       manSelected = false;
       womanSelcted = true;
       widget.onTap();
     });
   }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: manselted,
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: 53, horizontal: 44),
            ),
            backgroundColor: WidgetStateProperty.all(
              manSelected ? PuddingColor.main : PuddingColor.background
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: PuddingColor.brown, width: 1),
              ),
            ),
            minimumSize: WidgetStateProperty.all(Size(60, 80))
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/img/man.svg'),
            ],
          ),
        ),
        SizedBox(width: 31,),
        ElevatedButton(
          onPressed: girlselted,
          style: ButtonStyle(
              padding: WidgetStateProperty.all(
                EdgeInsets.symmetric(vertical: 53, horizontal: 44),
              ),
              backgroundColor: WidgetStateProperty.all(
                  womanSelcted ? PuddingColor.main : PuddingColor.background
              ),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: PuddingColor.brown, width: 1),
                ),
              ),
              minimumSize: WidgetStateProperty.all(Size(60, 80))
          ),
          child: Row(
            children: [
              SvgPicture.asset('assets/img/woman.svg'),
            ],
          ),
        ),
      ],
    );
  }
}
