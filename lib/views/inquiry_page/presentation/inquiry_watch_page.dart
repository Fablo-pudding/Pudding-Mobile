import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/data/models/inquiry_check.dart';
import 'package:pudding/common/data/service/inquiry_detail.dart';
import 'package:pudding/views/feed_page/components/comment_header.dart';
import 'package:pudding/views/inquiry_page/components/inquiry_edit.dart';
import 'package:pudding/views/inquiry_page/components/inquiry_header.dart';

class PuddingInquiryWatchPage extends StatefulWidget {
  final int id;
  const PuddingInquiryWatchPage({super.key, required this.id});

  @override
  State<PuddingInquiryWatchPage> createState() =>
      _PuddingInquiryWatchPageState();
}

class _PuddingInquiryWatchPageState extends State<PuddingInquiryWatchPage> {
  final DateTime dateTime = DateTime.now();
  late Future<InquiryCheck> _check;
  String get dateTimeFormat => DateFormat('yyyy-MM-dd').format(dateTime);
@override
  void initState() {
    super.initState();
    _check = InquiryDetailApi().inquiryDetailApi(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(
        title: '문의',
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Symbols.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: _check, builder: (BuildContext context,snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: PuddingInquiryHeader(
                          title: snapshot.data!.title,
                          userId: snapshot.data!.userName,
                          userImage: PuddingAssets.profile,
                          content: snapshot.data!.content,
                          date: dateTimeFormat,
                          admin: true,
                          puddingInquiryEdit: PuddingInquiryEdit(id: snapshot.data!.id,),
                        ),
                      ),
                    ),
                  ),
                  Divider(height: 1, thickness: 1, color: PuddingColor.brown),
                  const SizedBox(
                    height: 47,
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: PuddingCommentHeader(
                                  userId: '관리자',
                                  userImage: PuddingAssets.admin,
                                  content: '안녕하세요',
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
            else if(snapshot.hasError){
              return Center(child: Text('${snapshot.error.toString()}'),);
            }
            return Text('다시 시도해주세요');
        },
        ),
      ),
    );
  }
}
