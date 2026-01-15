import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/data/models/feed_detail_check.dart';
import 'package:pudding/views/feed_page/components/comment_header.dart';
import 'package:pudding/views/feed_page/components/feed_header.dart';
import 'package:pudding/views/feed_page/components/writing_edit.dart';
import 'package:intl/intl.dart';
import 'package:pudding/views/feed_page/presentation/feed_preview.dart';
import 'package:pudding/common/data/service/feed_detail_check.dart';

class PuddingCommentWrite extends StatefulWidget {
  final int postId;

  const PuddingCommentWrite({
    super.key,
    required this.postId
  });

  @override
  State<PuddingCommentWrite> createState() => _PuddingFeedPageState();
}

class _PuddingFeedPageState extends State<PuddingCommentWrite> {
  final DateTime dateTime = DateTime.now();
  final TextEditingController _commentController = TextEditingController();
  bool isEnabledButton = false;
  late FocusNode focusNode;
  late Future<FeedDetailCheck> postFuture;

  String get dateTimeFormat => DateFormat('yyyy-MM-dd').format(dateTime);

  @override
  void initState() {
    super.initState();
    _commentController.addListener(onChangedButton);
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {});
    });
    postFuture = CheckFeedDetail().feedDetailCheck(widget.postId);
  }

  @override
  void dispose() {
    _commentController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  void onChangedButton() {
    setState(() {
      isEnabledButton = _commentController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(
        title: '피드',
        leading: IconButton(
          onPressed: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => PuddingFeedPreview())
            // );
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const PuddingFeedPreview()), (route)=>false);
          },
          icon: Icon(Symbols.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: postFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SingleChildScrollView(
                        child: PuddingFeedHeader(
                          title: snapshot.data!.title,
                          userId: snapshot.data!.userName,
                          userImage: PuddingAssets.profile,
                          content: snapshot.data!.content,
                          date: dateTimeFormat,
                          postId: snapshot.data!.postId,
                          onEdited: () {
                            if (!mounted) return;
                            setState(() {
                              postFuture = CheckFeedDetail().feedDetailCheck(widget.postId);
                            });
                          },
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
                            itemCount: snapshot.data!.commentCount,
                            itemBuilder: (context, index) {
                              final comments = snapshot.data!.comments ?? '';
                              final comment = comments[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 15),
                                child: PuddingCommentHeader(
                                  userId: comment.userId,
                                  userImage: PuddingAssets.profile,
                                  content: comment.content,
                                ),
                              );
                            },
                          ),
                        ),
                        // Positioned(
                        //     right: 0,
                        //     child: PuddingFeedEdit(
                        //       postId: snapshot.data!.postId,
                        //       onEdited: () {
                        //         if (!mounted) return;
                        //         setState(() {
                        //           postFuture = CheckFeedDetail().feedDetailCheck(widget.postId);
                        //         });
                        //       },
                        //     )
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: PuddingTextFormField(
                      focusNode: focusNode,
                      maxLength: 255,
                      cursorColor: PuddingColor.brown,
                      controller: _commentController,
                      hintText: '댓글을 입력해주세요',
                      suffixIcon: IconButton(
                        onPressed: isEnabledButton
                            ? () {
                          ///todo 댓글 올리기
                        }
                            : null,
                        icon: Transform.rotate(
                          angle: -1,
                          child: Icon(
                            Symbols.send,
                            color: focusNode.hasFocus
                                ? PuddingColor.brown
                                : PuddingColor.gray400,
                            fill: 1,
                          ),
                        ),
                      ),
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

extension on Object {
  operator [](int other) {}
}
