import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/data/models/inquiry_check.dart';
import 'package:pudding/common/data/service/inquiry_admin_check.dart';
import 'package:pudding/views/inquiry_page/components/inquiry_article.dart';

class PuddingAdminInquiryPage extends StatefulWidget {
  const PuddingAdminInquiryPage({super.key});

  @override
  State<PuddingAdminInquiryPage> createState() =>
      _PuddingAdminInquiryPageState();
}

class _PuddingAdminInquiryPageState extends State<PuddingAdminInquiryPage> {
  late Future<List<InquiryCheck>> inquiryCheckFuture;

  @override
  void initState() {
    super.initState();
    inquiryCheckFuture = InquiryAdminCheckApi().inquiryAdminCheck();
  }

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
        child: FutureBuilder(
          future: inquiryCheckFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final inquiries = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: inquiries.length,
                      itemBuilder: (BuildContext context, int index) {
                        final inquiry = inquiries[index];
                        return PuddingInquiryArticle(
                          title: inquiry.title,
                          value: true,
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            else {
              return Center(child: CircularProgressIndicator());
            }
          }
        ),
      ),
    );
  }
}
