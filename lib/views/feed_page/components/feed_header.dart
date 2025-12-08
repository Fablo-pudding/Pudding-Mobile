import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/feed_page/components/writing_edit.dart';

class PuddingFeedHeader extends StatelessWidget {
  final String? title;
  final String userId;
  final String userImage;
  final String? content;
  final String? date;
  final String? commentContent;
  final double? height;
  final double? width;
  final PuddingFeedEdit? puddingFeedEdit;

  const PuddingFeedHeader({
    super.key,
    this.title,
    required this.userId,
    required this.userImage,
    this.content,
    this.date,
    this.commentContent,
    this.height,
    this.width,
    this.puddingFeedEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (title != null)
              Expanded(
                child: Text(
                  title!,
                  style: PuddingTextStyle.feedTitle.copyWith(
                    color: PuddingColor.black,
                  ),
                ),
              ),
            PuddingFeedEdit(),
          ],
        ),
        const SizedBox(height: 13,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              userImage,
              width: width ?? 46,
              height: height ?? 46,
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userId,
                  style: PuddingTextStyle.heading2,
                ),
                Text(
                  '$date',
                  style: PuddingTextStyle.body1.copyWith(
                    color: PuddingColor.gray400,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        if (content != null)
          Text(
            content!,
            style: PuddingTextStyle.body1.copyWith(color: PuddingColor.black),
          ),
      ],
    );
  }
}