import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/inquiry_page/presentation/admin/admin_inquiry_comment_page.dart';
import 'package:pudding/views/inquiry_page/presentation/inquiry_watch_page.dart';

class PuddingInquiryArticle extends StatefulWidget {
  final String title;
  final bool value;
  final int id;
  final DateTime created;

  const PuddingInquiryArticle({
    super.key,
    required this.title,
    required this.value,
    required this.id,
    required this.created
  });

  @override
  State<PuddingInquiryArticle> createState() => _PuddingInquiryArticleState();
}

class _PuddingInquiryArticleState extends State<PuddingInquiryArticle> {
  final DateTime writeDate = DateTime.now();

  String get dateTimeFormat => DateFormat('yyyy.MM.dd').format(writeDate);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PuddingColor.background,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: PuddingTextStyle.heading2.copyWith(
                        color: PuddingColor.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (widget.value) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  PuddingAdminInquiryCommentPage(id: widget.id,),
                            ),
                          );
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PuddingInquiryWatchPage(id: widget.id,),
                            ),
                          );
                        }
                      },
                      child: Icon(Symbols.arrow_forward_ios),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('작성일 ${DateFormat('yyyy-MM-dd').format(widget.created)}'),
              ],
            ),
          ),
          Divider(
            height: 1,
            color: PuddingColor.gray400,
          ),
        ],
      ),
    );
  }
}
