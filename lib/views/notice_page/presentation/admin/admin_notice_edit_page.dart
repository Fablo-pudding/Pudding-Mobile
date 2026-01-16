import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/common/data/models/notice_detail.dart';
import 'package:pudding/common/data/models/notice_edit.dart';
import 'package:pudding/common/data/service/notice_detail.dart';
import 'package:pudding/views/notice_page/components/notice_write.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_watch_page.dart';

class PuddingAdminNoticeEditPage extends StatefulWidget {
  final int postId;

  const PuddingAdminNoticeEditPage({super.key, required this.postId});

  @override
  State<PuddingAdminNoticeEditPage> createState() =>
      _PuddingAdminNoticeEditPageState();
}

class _PuddingAdminNoticeEditPageState
    extends State<PuddingAdminNoticeEditPage> {
  final TextEditingController noticeController = TextEditingController();
  final TextEditingController noticeContentController = TextEditingController();
  bool isEnabledButton = false;
  late FocusNode _focusNode;
  late Future<NoticeDetail> create;

  @override
  void initState() {
    create = NoticeDetailApi().noticeDetail(widget.postId);
    create.then((post){
      noticeController.text = post.title;
      noticeContentController.text = post.content;
    });
    noticeController.addListener(onChangedButton);
    noticeContentController.addListener(onChangedButton);
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    noticeController.dispose();
    noticeContentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void onChangedButton() {
    setState(() {
      isEnabledButton =
          noticeController.text.isNotEmpty &&
          noticeContentController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(
        title: '공지사항',
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "뒤로",
            style: PuddingTextStyle.heading3.copyWith(
              color: PuddingColor.gray400,
            ),
          ),
        ),
        rightText: TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => PuddingAdminNoticeWatchPage(
                  postId: widget.postId,
                ),
              ),
            );
          },
          child: Text(
            "수정",
            style: PuddingTextStyle.heading3,
          ),
        ),
      ),
      body: SafeArea(
        child: NoticeWrite(
          focusNode: _focusNode,
          commentController: noticeController,
          contentController: noticeContentController,
        ),
      ),
    );
  }
}
