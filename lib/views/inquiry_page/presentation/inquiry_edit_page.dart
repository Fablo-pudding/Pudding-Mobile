import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/feed_page/presentation/comment_write.dart';
import 'package:pudding/views/inquiry_page/presentation/inquiry_watch_page.dart';

class PuddingInquiryEditPage extends StatefulWidget {
  final int id;
  const PuddingInquiryEditPage({super.key,required this.id});

  @override
  State<PuddingInquiryEditPage> createState() => _PuddingInquiryWritePageState();
}

class _PuddingInquiryWritePageState extends State<PuddingInquiryEditPage> {
  final TextEditingController inquiryController = TextEditingController();
  final TextEditingController inquiryContentController = TextEditingController();
  bool isEnabledButton = false;
  final commentFocusNode = FocusNode();

  @override
  void initState() {
    inquiryController.addListener(onChangedButton);
    inquiryContentController.addListener(onChangedButton);
    super.initState();
  }

  @override
  void dispose() {
    inquiryController.dispose();
    inquiryContentController.dispose();
    commentFocusNode.dispose();
    super.dispose();
  }

  void onChangedButton() {
    setState(() {
      isEnabledButton =
          inquiryController.text.isNotEmpty &&
              inquiryContentController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(
        title: '문의',
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("뒤로",style: PuddingTextStyle.heading3.copyWith(color: PuddingColor.gray400,),),
        ),
        rightText: TextButton(
          onPressed: isEnabledButton ? () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>PuddingInquiryWatchPage(id: widget.id,)));
          } : null,
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
              controller: inquiryController,
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
                  commentFocusNode.requestFocus();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PuddingTextFormField(
                    maxLength: 255,
                    filled: false,
                    controller: inquiryContentController,
                    hintText: '내용을 입력해 주세요',
                    hintStyle: PuddingTextStyle.body1.copyWith(
                      color: PuddingColor.gray400,
                    ),
                    focusNode: commentFocusNode,
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
