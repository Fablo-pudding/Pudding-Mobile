import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/data/models/notice_check.dart';
import 'package:pudding/common/data/service/notice_all_check.dart';
import 'package:pudding/views/my_page/presentation/my_page.dart';
import 'package:pudding/views/notice_page/components/notice_article.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_write_page.dart';

class PuddingAdminNoticePage extends StatefulWidget {
  const PuddingAdminNoticePage({super.key});

  @override
  State<PuddingAdminNoticePage> createState() => _PuddingAdminNoticePageState();
}

class _PuddingAdminNoticePageState extends State<PuddingAdminNoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(
        title: '공지사항',
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: () {
            Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context)=>const PuddingMyPage()), (route)=>false);
            },
            child: const Icon(
              Symbols.arrow_back_ios_new,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: NoticeAllCheckApi().noticeAllCheck(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('오류입니다 ${snapshot.error.toString()}'),
              );
            } else if (snapshot.hasData) {
              final List<NoticeCheck> notices = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: notices.length,
                      itemBuilder: (BuildContext context, int index) {
                        final noticeCheck = notices[index];
                        return PuddingNoticeArticle(
                          title: noticeCheck.title,
                          writeDate: '${noticeCheck.createAt}',
                          admin: true,
                          postId: noticeCheck.id,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: PuddingElevatedButton(
                            child: const Text('새 공지사항 작성'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PuddingAdminNoticeWritePage(),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
            ;
            return Center(child: Text('에러'));
          },
        ),
      ),
    );
  }
}
