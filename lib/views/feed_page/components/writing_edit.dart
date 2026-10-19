import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/modal/check_modal.dart';
import 'package:pudding/common/components/modal/lack_modal.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/common/data/service/feed_delete.dart';
import 'package:pudding/views/feed_page/presentation/feed_edit.dart';

class PuddingFeedEdit extends StatefulWidget {
  final int postId;
  final void Function() onEdited;

  const PuddingFeedEdit({
    super.key,
    required this.postId,
    required this.onEdited,
  });

  @override
  State<PuddingFeedEdit> createState() => _PuddingEditState();
}

class _PuddingEditState extends State<PuddingFeedEdit> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      constraints: BoxConstraints(minWidth: 80),
      color: PuddingColor.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: PuddingColor.brown),
      ),
      icon: Icon(
        Symbols.more_vert,
        size: 20,
        color: PuddingColor.gray400,
      ),
      onSelected: (String value) {
        if (value == 'delete') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              /// todo 작성자가 아닐 시 삭제 불가
              return CheckModal(
                message: '피드를 삭제하시겠습니까?',
                onConfirm: () async {
                  Navigator.pop(context);
                  try {
                    await FeedDelete().feedDelete(widget.postId);

                    if (!mounted) return;

                    Navigator.of(context).pop(true);
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (_) => LackModal(message: '작성자만 삭제 가능합니다.'),
                    );
                  }
                },
              );
            },
          );
        } else if (value == 'edit') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CheckModal(
                message: '피드를 수정하시겠습니까?',
                onConfirm: () async {
                  ///todo 작성자가 아닐 시 수정 불가
                  Navigator.pop(context);
                  final result = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) =>
                          PuddingFeedEditPage(postId: widget.postId),
                    ),
                  );

                  if (!context.mounted) return;

                  if (result == true) {
                    widget.onEdited();
                  }
                },
              );
            },
          );
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'delete',
          height: 36,
          child: Center(
            child: Text(
              '삭제',
              style: PuddingTextStyle.heading3.copyWith(
                color: PuddingColor.red,
              ),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'edit',
          height: 36,
          child: Center(
            child: Text(
              '수정',
              style: PuddingTextStyle.heading3,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
