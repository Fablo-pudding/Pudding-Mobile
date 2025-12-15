import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
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
      appBar: PuddingAppBar(title: '공지사항',
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(
              Symbols.arrow_back_ios_new,
            ),
          ),
        ),),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index){
                    return PuddingNoticeArticle(title: '안녕하세요', writeDate: '등록일', admin: true,);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: PuddingElevatedButton(child: Text('새 공지사항 작성'), onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PuddingAdminNoticeWritePage()));
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
