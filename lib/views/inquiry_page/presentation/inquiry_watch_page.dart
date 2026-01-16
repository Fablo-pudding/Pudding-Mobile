import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/data/models/inquiry_check.dart';
import 'package:pudding/common/data/service/inquiry_detail.dart';
import 'package:pudding/common/data/service/notice_detail.dart';
import 'package:pudding/common/data/service/reply.dart';
import 'package:pudding/views/feed_page/components/comment_header.dart';
import 'package:pudding/views/inquiry_page/components/inquiry_edit.dart';
import 'package:pudding/views/inquiry_page/components/inquiry_header.dart';

class PuddingInquiryCommentPage extends StatefulWidget {
  final int id;
  const PuddingInquiryCommentPage({
    super.key,
    required this.id
  });

  @override
  State<PuddingInquiryCommentPage> createState() =>
      _PuddingInquiryCommentPageState();
}

class _PuddingInquiryCommentPageState
    extends State<PuddingInquiryCommentPage> {
  final DateTime dateTime = DateTime.now();
  final TextEditingController _commentController = TextEditingController();
  bool isEnabledButton = false;
  final commentFocusNode = FocusNode();
  late Future<InquiryCheck> _future;

  String get dateTimeFormat => DateFormat('yyyy-MM-dd').format(dateTime);

  @override
  void initState() {
    super.initState();
    _commentController.addListener(onChangedButton);
    _future = InquiryDetailApi().inquiryDetailApi(widget.id);
  }

  @override
  void dispose() {
    _commentController.dispose();
    commentFocusNode.dispose();
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
      resizeToAvoidBottomInset: false,
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
            future: _future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
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
                            date: DateFormat('yyyy-MM-dd').format(snapshot.data!.createdAt),
                            admin: false,
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
                              child: Padding(
                                  padding: const EdgeInsets.only(bottom: 15),
                                  child: snapshot.data!.reply != null
                                      ? PuddingCommentHeader(
                                    userId: '관리자',
                                    userImage: PuddingAssets.admin,
                                    content: snapshot.data!.reply ?? '',
                                  ) : Center(child: Text(' '))
                              )
                          ),
                          Positioned(right: 0, child: PuddingInquiryEdit(
                            id: widget.id,)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: PuddingTextFormField(
                        focusNode: commentFocusNode,
                        maxLength: 255,
                        cursorColor: PuddingColor.brown,
                        controller: _commentController,
                        hintText: '댓글을 입력해주세요',
                        suffixIcon: IconButton(
                          onPressed: isEnabledButton
                              ? () async {
                            ///todo 댓글 올리기
                            try {
                              await Reply().reply(
                                  reply: _commentController.text,
                                  id: widget.id
                              );

                              _commentController.clear();
                              commentFocusNode.unfocus();

                              setState(() {
                                _future = InquiryDetailApi().inquiryDetailApi(widget.id);
                                isEnabledButton = false;
                              });
                            } catch(e) {
                              if (!mounted) return;
                              print(e);
                            }
                          }
                              : null,
                          icon: Transform.rotate(
                            angle: -1,
                            child: Icon(
                              Symbols.send,
                              color: commentFocusNode.hasFocus
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
