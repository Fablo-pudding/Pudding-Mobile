import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/constants/color.dart';

enum Gender { man, woman }

class PuddingGenderButton extends StatefulWidget {
  final void Function() onTap;

  const PuddingGenderButton({super.key, required this.onTap});

  @override
  State<PuddingGenderButton> createState() => _PuddingGenderButtonState();
}

class _PuddingGenderButtonState extends State<PuddingGenderButton> {
   Gender? gender;

  void selctedGender(Gender genderSelcet) {
    setState(() {
      gender = genderSelcet;
      widget.onTap();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () => selctedGender(Gender.man),
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: 53, horizontal: 44),
            ),
            backgroundColor: WidgetStateProperty.all(
              gender == Gender.man
                  ? PuddingColor.main
                  : PuddingColor.background,
            ),

            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: PuddingColor.brown, width: 1),
              ),
            ),
            minimumSize: WidgetStateProperty.all(Size(60, 80)),
          ),
          child: Row(children: [SvgPicture.asset('assets/img/man.svg')]),
        ),
        SizedBox(width: 31),
        ElevatedButton(
          onPressed: () => selctedGender(Gender.woman),
          style: ButtonStyle(
            padding: WidgetStateProperty.all(
              EdgeInsets.symmetric(vertical: 53, horizontal: 44),
            ),
            backgroundColor: WidgetStateProperty.all(
              gender == Gender.woman
                  ? PuddingColor.main
                  : PuddingColor.background,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: PuddingColor.brown, width: 1),
              ),
            ),
            minimumSize: WidgetStateProperty.all(Size(60, 80)),
          ),
          child: Row(children: [SvgPicture.asset('assets/img/woman.svg')]),
        ),
      ],
    );
  }
}
