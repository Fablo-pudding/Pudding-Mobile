import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/views/inquiry_page/components/inquiry_article.dart';

class PuddingAdminInquiryPage extends StatefulWidget {
  const PuddingAdminInquiryPage({super.key});

  @override
  State<PuddingAdminInquiryPage> createState() =>
      _PuddingAdminInquiryPageState();
}

class _PuddingAdminInquiryPageState extends State<PuddingAdminInquiryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(
        title: '문의',
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
                  return PuddingInquiryArticle(
                    title: '안녕하세요',
                    value: true,
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
