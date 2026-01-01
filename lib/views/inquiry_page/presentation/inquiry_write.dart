import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/modal/check_modal.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/inquiry_page/presentation/inquiry_watch_page.dart';

class PuddingInquiryWrite extends StatefulWidget {
  const PuddingInquiryWrite({super.key});

  @override
  State<PuddingInquiryWrite> createState() => _PuddingInquiryWritePageState();
}

class _PuddingInquiryWritePageState extends State<PuddingInquiryWrite> {
  final TextEditingController inquiryController = TextEditingController();
  final TextEditingController inquiryContentController =
      TextEditingController();
  bool isEnabledButton = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    inquiryController.addListener(onChangedButton);
    inquiryContentController.addListener(onChangedButton);
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    inquiryController.dispose();
    inquiryContentController.dispose();
    _focusNode.dispose();
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
        title: '문의작성',
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
          onPressed: isEnabledButton
              ? () {
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return CheckModal(
                        message: '작성한 문의 내용을 등록하시겠습니까?',
                        onConfirm: () {
                          Navigator.of(dialogContext).pop();
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => PuddingInquiryWatchPage(),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              : null,
          child: Text(
            "등록",
            style: PuddingTextStyle.heading3,
          ),
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
              choiceFocusBorder: false,
              choiceEnableBorder: false,
              filled: false,
              controller: inquiryController,
              textAlign: TextAlign.center,
              hintText: '제목을 입력해 주세요',
              hintStyle: PuddingTextStyle.heading2.copyWith(
                color: PuddingColor.gray400,
              ),
              style: PuddingTextStyle.heading2,
              maxLength: 101,
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
                    filled: false,
                    controller: inquiryContentController,
                    hintText: '내용을 입력해 주세요',
                    hintStyle: PuddingTextStyle.body1.copyWith(
                      color: PuddingColor.gray400,
                    ),
                    style: PuddingTextStyle.body1,
                    maxLength: 513,
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
