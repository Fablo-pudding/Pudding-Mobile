import 'package:flutter/material.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class NoticeWrite extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController commentController;
  final TextEditingController contentController;

  const NoticeWrite(
      {super.key, required this.focusNode, required this.commentController, required this.contentController});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: commentController,
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
              focusNode.requestFocus();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PuddingTextFormField(
                maxLength: 255,
                filled: false,
                controller: contentController,
                hintText: '내용을 입력해 주세요',
                hintStyle: PuddingTextStyle.body1.copyWith(
                  color: PuddingColor.gray400,
                ),
                focusNode: focusNode,
                choiceFocusBorder: false,
                choiceEnableBorder: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
