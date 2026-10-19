import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/modal/lack_modal.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/common/data/models/feed_detail_check.dart';
import 'package:pudding/common/data/service/feed_check.dart';
import 'package:pudding/common/data/service/feed_detail_check.dart';
import 'package:pudding/views/feed_page/presentation/comment_write.dart';
import 'package:pudding/common/data/service/feed_edit.dart';

class PuddingFeedEditPage extends StatefulWidget {
  final int postId;

  const PuddingFeedEditPage({super.key, required this.postId});

  @override
  State<PuddingFeedEditPage> createState() => _PuddingFeedWritePageState();
}

class _PuddingFeedWritePageState extends State<PuddingFeedEditPage> {
  final TextEditingController feedController = TextEditingController();
  final TextEditingController feedContentController = TextEditingController();
  bool isEnabledButton = false;
  late FocusNode _focusNode;
  late Future<FeedDetailCheck> postFuture;

  @override
  void initState() {
    postFuture = CheckFeedDetail().feedDetailCheck(widget.postId);

    postFuture.then((post) {
      feedController.text = post.title ?? '';
      feedContentController.text = post.content ?? '';
    });

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
        title: '피드',
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("뒤로",style: PuddingTextStyle.heading3.copyWith(color: PuddingColor.gray400,),),
        ),
        rightText: TextButton(
          onPressed: () async {
            try {
              await FeedEdit().feedEdit(
                  postId: widget.postId,
                  title: feedController.text,
                  content: feedContentController.text
              );

              if (!mounted) return;
              Navigator.pop(context, true);
            } catch (e) {
              print(e);
              if (!mounted) return;
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) {
                  return LackModal(
                    message: '작성자만 수정이 가능합니다.',
                  );
                },
              );
            }
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
