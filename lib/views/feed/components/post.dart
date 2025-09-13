import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingPost extends StatelessWidget {
  final String username;
  final String time;
  final String title;
  final int commentCount;
  final String profileImg;
  final double? width;

  const PuddingPost({
    super.key,
    required this.username,
    required this.time,
    required this.title,
    required this.commentCount,
    required this.profileImg,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: width,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: PuddingColor.brown, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 22),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: PuddingColor.gray400,
                  child: Image.network(
                    profileImg,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, StackTrace) {
                      return Icon(
                        Symbols.person,
                        fill: 1,
                        color: PuddingColor.gray200,
                        size: 50,
                      );
                    },
                  ),
                ),
                const SizedBox(width: 9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: PuddingTextStyle.heading3.copyWith(
                        color: PuddingColor.brown,
                      ),
                    ),
                    Text(
                      time,
                      style: PuddingTextStyle.body3.copyWith(
                        color: PuddingColor.gray400,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                style: PuddingTextStyle.heading3.copyWith(
                  color: PuddingColor.black,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Divider(color: PuddingColor.brown),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
            child: Row(
              children: [
                Icon(
                  Symbols.chat_bubble,
                  color: PuddingColor.gray400,
                  size: 14,
                ),
                const SizedBox(width: 6),
                Text(
                  '댓글 $commentCount',
                  style: PuddingTextStyle.body3.copyWith(
                    color: PuddingColor.gray400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
