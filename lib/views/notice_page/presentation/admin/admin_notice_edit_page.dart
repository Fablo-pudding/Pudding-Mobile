import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/feed_page/presentation/comment_write.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_watch_page.dart';

class PuddingAdminNoticeEditPage extends StatefulWidget {
  const PuddingAdminNoticeEditPage({super.key});

  @override
  State<PuddingAdminNoticeEditPage> createState() => _PuddingAdminNoticeEditPageState();
}

class _PuddingAdminNoticeEditPageState extends State<PuddingAdminNoticeEditPage> {
  final TextEditingController feedController = TextEditingController();
  final TextEditingController feedContentController = TextEditingController();
  bool isEnabledButton = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    feedController.addListener(onChangedButton);
    feedContentController.addListener(onChangedButton);
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    feedController.dispose();
    feedContentController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void onChangedButton() {
    setState(() {
      isEnabledButton =
          feedController.text.isNotEmpty &&
              feedContentController.text.isNotEmpty;
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
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>PuddingAdminNoticeWatchPage()));
          },
          child: Text("수정",style: PuddingTextStyle.heading3,),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Divider(
              height: 1,
              thickness: 1,
              color: PuddingColor.brown,
            ),
            PuddingTextFormField(
              maxLength: 100,
              style: PuddingTextStyle.heading2,
              choiceFocusBorder: false,
              choiceEnableBorder: false,
              filled: false,
              controller: feedController,
              textAlign: TextAlign.center,
              hintText: '제목을 입력해 주세요',
              hintStyle: PuddingTextStyle.heading3.copyWith(
                color: PuddingColor.gray400,
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: PuddingColor.brown,
            ),
            const SizedBox(
              height: 19,
            ),
            Expanded(
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  _focusNode.requestFocus();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PuddingTextFormField(
                    maxLength: 255,
                    filled: false,
                    controller: feedContentController,
                    hintText: '내용을 입력해 주세요',
                    hintStyle: PuddingTextStyle.body1.copyWith(
                      color: PuddingColor.gray400,
                    ),
                    focusNode: _focusNode,
                    choiceFocusBorder: false,
                    choiceEnableBorder: false,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
