import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/views/notice_page/components/notice_article.dart';

class PuddingNoticePage extends StatefulWidget {
  final int postId;

  const PuddingNoticePage({super.key, required this.postId});

  @override
  State<PuddingNoticePage> createState() => _PuddingNoticePageState();
}

class _PuddingNoticePageState extends State<PuddingNoticePage> {
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
              Navigator.of(context).pop();
            },
            child: Icon(
              Symbols.arrow_back_ios_new,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return PuddingNoticeArticle(
                    title: '안녕하세요',
                    writeDate: '등록일',
                    admin: false,
                    postId: widget.postId,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
