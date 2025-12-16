import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/modal/check_modal.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/notice_page/components/notice_write.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_watch_page.dart';

class PuddingAdminNoticeWritePage extends StatefulWidget {
  const PuddingAdminNoticeWritePage({super.key});

  @override
  State<PuddingAdminNoticeWritePage> createState() => _PuddingAdminNoticeWritePageState();
}

class _PuddingAdminNoticeWritePageState extends State<PuddingAdminNoticeWritePage> {
  final TextEditingController noticeController = TextEditingController();
  final TextEditingController noticeContentController = TextEditingController();
  bool isEnabledButton = false;
  late FocusNode _focusNode;

  @override
  void initState() {
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
          child: Text("뒤로",style: PuddingTextStyle.heading3.copyWith(color: PuddingColor.gray400,),),
        ),
        rightText: TextButton(
          onPressed: isEnabledButton ? () {
            showDialog(context: context, builder: (dialogContext){
              return CheckModal(message: '작성한 공지 내용을 등록하시겠습니까?', onConfirm: (){
                Navigator.of(dialogContext).pop();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const PuddingAdminNoticeWatchPage(),
                    ));
              });
            });} : null,
          child: Text("등록",style: PuddingTextStyle.heading3,),
        ),
      ),
      body: SafeArea(
        child: NoticeWrite(focusNode: _focusNode, commentController: noticeController, contentController: noticeContentController),
      ),
    );
  }
}

