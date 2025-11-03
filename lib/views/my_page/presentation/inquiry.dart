import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingInquiry extends StatelessWidget {
  const PuddingInquiry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(title: '문의'),
      body: NoticeDialog(),
    );
  }
}

class NoticeDialog extends StatelessWidget {
  const NoticeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: PuddingColor.main,
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              '아직 개발중입니다',
              style: PuddingTextStyle.heading2,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Divider(
            thickness: 1,
            height: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      '돌아가기',
                      style: PuddingTextStyle.heading3.copyWith(
                        color: PuddingColor.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

