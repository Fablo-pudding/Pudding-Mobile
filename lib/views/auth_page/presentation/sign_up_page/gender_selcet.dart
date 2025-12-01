import 'package:flutter/material.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/views/auth_page/components/gender_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingSignUpGenderSelect extends StatefulWidget {
  final void Function()? next;
  final void Function()? back;

  const PuddingSignUpGenderSelect({super.key, this.next, this.back});

  @override
  State<PuddingSignUpGenderSelect> createState() =>
      _PuddingSignUpGenderSelectState();
}

class _PuddingSignUpGenderSelectState extends State<PuddingSignUpGenderSelect> {
  bool selectButton = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 32,),
              Text(
                '성별 선택',
                style: PuddingTextStyle.heading3,
              ),
              const SizedBox(height: 48,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PuddingGenderButton(
                    onTap: () {
                      setState(() {
                        selectButton = true;
                      });
                    },
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: PuddingElevatedButton(
                      onPressed: () {
                        widget.back?.call();
                      },
                      child: Text('이전'),
                    ),
                  ),
                  const SizedBox(width: 22,),
                  Expanded(
                    child: PuddingElevatedButton(
                      onPressed: selectButton
                          ? () {
                              widget.next?.call();
                            }
                          : null,
                      child: Text('다음'),
                    ),
                  ),
                ],
              ),
             const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
