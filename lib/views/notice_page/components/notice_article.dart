import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_watch_page.dart';
import 'package:pudding/views/notice_page/presentation/notice_watch_page.dart';

class PuddingNoticeArticle extends StatelessWidget {
  final String title;
  final String writeDate;
  final bool admin;

  const PuddingNoticeArticle({
    super.key,
    required this.title,
    required this.writeDate,
    required this.admin,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime writeDate = DateTime.now();

   final String dateTimeFormat = DateFormat('yyyy.MM.dd').format(writeDate);
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
                      title,
                      style: PuddingTextStyle.heading2.copyWith(
                        color: PuddingColor.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (admin) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                 const PuddingAdminNoticeWatchPage(),
                            ),
                          );
                        } else {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PuddingNoticeWatchPage(),
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
                Text('작성일 $dateTimeFormat'),
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
