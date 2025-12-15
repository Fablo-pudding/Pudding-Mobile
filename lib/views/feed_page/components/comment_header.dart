import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/feed_page/components/writing_edit.dart';

class PuddingCommentHeader extends StatelessWidget {
  final String userId;
  final String userImage;
  final String content;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;

  const PuddingCommentHeader({
    super.key,
    required this.userId,
    required this.userImage,
    required this.content,
    this.onDelete,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            userImage,
            width: 36,
            height: 36,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userId,
                  style: PuddingTextStyle.heading3,
                ),
                const SizedBox(height: 2),
                Text(
                  content,
                  style: PuddingTextStyle.body1.copyWith(color: PuddingColor.black),
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
