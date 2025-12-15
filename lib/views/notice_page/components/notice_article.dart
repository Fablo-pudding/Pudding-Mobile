import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/notice_page/presentation/notice_watch_page.dart';

class PuddingNoticeArticle extends StatelessWidget {
  final String title;
  final String writeDate;

  const PuddingNoticeArticle({
    super.key,
    required this.title,
    required this.writeDate,
  });

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: PuddingTextStyle.heading2.copyWith(
                    color: PuddingColor.black,
                  ),
                ),
                GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PuddingNoticeWatchPage()));
                    },
                    child: Icon(Symbols.arrow_forward_ios)),
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
