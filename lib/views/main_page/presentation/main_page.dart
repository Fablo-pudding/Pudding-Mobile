import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/main_page/components/study_control.dart';

class PuddingMainPage extends StatelessWidget {
  final double? height;

  const PuddingMainPage({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 72),
          StudyControlBanner(),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: height ?? 68,
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PuddingColor.main,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: PuddingColor.brown),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
