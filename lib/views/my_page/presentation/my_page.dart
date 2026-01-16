import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/data/models/my_info.dart';
import 'package:pudding/common/data/service/my_info.dart';
import 'package:pudding/views/inquiry_page/presentation/admin/admin_inquiry_page.dart';
import 'package:pudding/views/inquiry_page/presentation/inquiry_page.dart';
import 'package:pudding/views/my_page/components/menu.dart';
import 'package:pudding/views/my_page/components/my_page_ranking.dart';
import 'package:pudding/views/my_page/components/profile.dart';
import 'package:pudding/views/my_page/presentation/log_out.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_page.dart';
import 'package:pudding/views/notice_page/presentation/notice_page.dart';

class PuddingMyPage extends ConsumerStatefulWidget {
  const PuddingMyPage({super.key});

  @override
  ConsumerState<PuddingMyPage> createState() => _PuddingMyPageState();
}

class _PuddingMyPageState extends ConsumerState<PuddingMyPage> {
  late Future<MyInfo?> myInfo;

  @override
  void initState() {
    super.initState();
    myInfo = MyInfoApi().myInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: const PuddingAppBar(title: '마이페이지'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FutureBuilder(
          future: myInfo,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  PuddingProfile(
                    nickName: snapshot.data!.name,
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    children: [
                      PuddingMyPageRanking(
                        ranking: '${snapshot.data!.ranking}',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  PuddingMenu(
                    menuName: '공지사항',
                    textColor: PuddingColor.black,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PuddingAdminNoticePage(),
                        ),
                      );
                    },
                    icon: const Icon(Symbols.arrow_forward_ios),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  PuddingMenu(
                    menuName: '문의',
                    textColor: PuddingColor.black,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  PuddingInquiryPage(),
                        ),
                      );
                    },
                    icon: const Icon(Symbols.arrow_forward_ios),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PuddingLogOut(),
                        ),
                      );
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
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('에러 발생: ${snapshot.error}'),
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
