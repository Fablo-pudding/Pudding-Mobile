import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/common/data/models/notice_edit.dart';
import 'package:pudding/views/notice_page/components/notice_edit.dart';

class PuddingNoticeHeader extends StatelessWidget {
  final String? title;
  final String? content;
  final String? date;
  final String? commentContent;
  final double? height;
  final double? width;
  final PuddingNoticeEdit? puddingNoticeEdit;
  final bool edit;
  final int postId;
  final int? noticeId;

  const PuddingNoticeHeader({
    super.key,
    this.title,
    this.content,
    this.date,
    this.commentContent,
    this.height,
    this.width,
    this.puddingNoticeEdit,
    required this.edit,
    required this.postId,
    this.noticeId,
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
            PuddingNoticeEdit(
              edit: edit,
              postId: postId,
              notice: NoticeEdit( title: title ?? '', content: content ?? ''),
            ),
          ],
        ),
        const SizedBox(
          height: 13,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              PuddingAssets.admin,
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
                  '관리자',
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
