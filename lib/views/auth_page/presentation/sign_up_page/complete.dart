import 'package:flutter/material.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/views/auth_page/components/tab_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/login_page.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/pudding_title.dart';

class PuddingComplete extends StatefulWidget {
  const PuddingComplete({super.key});

  @override
  State<PuddingComplete> createState() => _PuddingCompleteState();
}

class _PuddingCompleteState extends State<PuddingComplete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 52,
              ),
              Text(
                '계정 생성 성공!',
                style: PuddingTextStyle.heading2,
              ),
              Text(
                '로그인하고 푸딩을 사용해보세요',
                style: PuddingTextStyle.body1.copyWith(
                  color: PuddingColor.gray400,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: PuddingElevatedButton(
                      child: Text('로그인하러 가기'),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const PuddingTitle(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
