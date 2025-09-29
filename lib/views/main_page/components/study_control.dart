import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/main_page/components/stopwatch.dart';
import 'package:pudding/views/main_page/components/time_display.dart';

class StudyControlBanner extends StatefulWidget {
  const StudyControlBanner({super.key,});

  @override
  State<StudyControlBanner> createState() => _StudyControlBannerState();
}

class _StudyControlBannerState extends State<StudyControlBanner> {
  int _timeInSeconds = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            width: double.infinity,
            height: 160,
            decoration: BoxDecoration(
              color: const Color(0xFFFFE875),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '공부를 시작하고\n푸딩을 만들어보세요!',
                        style: PuddingTextStyle.heading1.copyWith(
                          color: PuddingColor.brown,
                        ),
                      ),
                      const SizedBox(height: 12),
                      PuddingStopWatch(
                        onTick: (seconds) {
                          setState(() => _timeInSeconds = seconds);
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: -10,
                  child: SvgPicture.asset(
                    PuddingAssets.pudding,
                    width: 190,
                    height: 190,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
       TimeDisplayBanner(timeInSeconds: _timeInSeconds),
      ],
    );
  }
}
