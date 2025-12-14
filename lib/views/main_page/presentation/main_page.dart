import 'package:flutter/material.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/main_page/components/study_control.dart';

class PuddingMainPage extends StatelessWidget {
  const PuddingMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      body: SafeArea(
        child: Column(
          spacing: 16,
          children: const [
            StudyControlBanner(),
            _QuestionBanner(),
          ],
        ),
      ),
    );
  }
}

class _QuestionBanner extends StatelessWidget {
  const _QuestionBanner();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        height: 68,
        decoration: BoxDecoration(
          color: PuddingColor.main,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '모르는 것이 있나요?',
                style: PuddingTextStyle.heading3.copyWith(
                  color: PuddingColor.brown,
                ),
              ),
              PuddingElevatedButton(
                onPressed: () {},
                backgroundColor: PuddingColor.main,
                child: Text(
                  '물어보러가기',
                  style: PuddingTextStyle.body1.copyWith(
                    color: PuddingColor.brown,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}