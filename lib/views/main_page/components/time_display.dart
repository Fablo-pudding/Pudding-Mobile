import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/common/utils/format.dart';

class TimeDisplayBanner extends StatelessWidget {
  final int timeInSeconds;

  const TimeDisplayBanner({
    super.key,
    required this.timeInSeconds,
  });

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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '푸딩 만든 시간',
                    style: PuddingTextStyle.heading3.copyWith(
                      color: PuddingColor.brown,
                    ),
                  ),
                  Text(
                    '공부한 시간',
                    style: PuddingTextStyle.body1.copyWith(
                      color: PuddingColor.black,
                    ),
                  ),
                ],
              ),
              Text(
                Format.time(timeInSeconds),
                style: PuddingTextStyle.heading1.copyWith(
                  color: PuddingColor.brown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
