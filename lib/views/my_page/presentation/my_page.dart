import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/views/my_page/components/menu.dart';
import 'package:pudding/views/my_page/components/my_page_ranking.dart';
import 'package:pudding/views/my_page/components/profile.dart';
import 'package:pudding/views/my_page/presentation/inquiry.dart';
import 'package:pudding/views/my_page/presentation/log_out.dart';
import 'package:pudding/views/my_page/presentation/notice.dart';

class PuddingMyPage extends StatefulWidget {
  const PuddingMyPage({super.key});

  @override
  State<PuddingMyPage> createState() => _PuddingMyPageState();
}

class _PuddingMyPageState extends State<PuddingMyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: const PuddingAppBar(title: '마이페이지'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            const PuddingProfile(nickName: '최승우', explanation: '대마고 1학년 2반 16번'),
            const SizedBox(
              height: 48,
            ),
            const Row(
              children: [
                PuddingMyPageRanking(ranking: 3),
              ],
            ),
            const SizedBox(
              height: 48,
            ),
            PuddingMenu(
              menuName: '공지사항',
              textColor: PuddingColor.black,
              iconButton: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const PuddingNotice()));
                  // todo 공지사항 넣기
                },
                child: const Icon(Symbols.arrow_forward_ios),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            PuddingMenu(
              menuName: '문의',
              textColor: PuddingColor.black,
              iconButton: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const PuddingInquiry()));
                  //todo 문의 넣기
                },
                child: const Icon(Symbols.arrow_forward_ios),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const PuddingLogOut()));
              },
              child: const PuddingMenu(
                menuName: '로그아웃',
                textColor: PuddingColor.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

