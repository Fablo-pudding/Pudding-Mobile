import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/data/models/notice_detail.dart';
import 'package:pudding/common/data/service/notice_detail.dart';
import 'package:pudding/views/notice_page/components/notice_header.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_page.dart';

class PuddingAdminNoticeWatchPage extends StatefulWidget {
  final int postId;

  const PuddingAdminNoticeWatchPage({
    required this.postId,
    super.key,
  });

  @override
  State<PuddingAdminNoticeWatchPage> createState() =>
      _PuddingAdminNoticeWatchPageState();
}

class _PuddingAdminNoticeWatchPageState
    extends State<PuddingAdminNoticeWatchPage> {
  final DateTime dateTime = DateTime.now();
  late Future<NoticeDetail> _future;


  @override
  void initState() {
    super.initState();
    _future = NoticeDetailApi().noticeDetail(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(
        title: '공지사항',
        leading: IconButton(
          onPressed: () =>Navigator.of(context).pushAndRemoveUntil(CupertinoPageRoute(builder: (context)=>const PuddingAdminNoticePage()), (route)=>false),
          icon: const Icon(Symbols.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<NoticeDetail>(
          future: _future,
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final data = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: PuddingNoticeHeader(
                          title: data.title,
                          content: data.content,
                          date: DateFormat('yyyy-MM-dd').format(data.createdAt.toUtc().toLocal()),
                          edit: false,
                          postId: widget.postId,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('에러 ${snapshot.error.toString()}}'),
              );
            }
            return const Text('다시 시도해주세요');
          },
        ),
      ),
    );
  }
}
