import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/modal/check_modal.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/feed_page/presentation/comment_write.dart';
import 'package:pudding/views/feed_page/presentation/feed_edit.dart';

class PuddingFeedEdit extends StatefulWidget {
  const PuddingFeedEdit({super.key,});

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
              return CheckModal(message: '삭제하시겠습니까?', onConfirm: null);
              });
        } else if (value == 'edit') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CheckModal(message: '수정하시겠습니까?', onConfirm: (){
                  ///todo 작성자가 아닐 시 수정 불가
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PuddingFeedEditPage()),
                  );
                });
              });
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'delete',
          height: 36,
          child : Center(
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