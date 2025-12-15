import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/modal/check_modal.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_edit_page.dart';

class PuddingNoticeEdit extends StatefulWidget {
  const PuddingNoticeEdit({super.key,});

  @override
  State<PuddingNoticeEdit> createState() => _PuddingNoticeEditState();
}

class _PuddingNoticeEditState extends State<PuddingNoticeEdit> {
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
                return CheckModal(message: '작성한 공지를 삭제하시겠습니까?', onConfirm: null);
              });
        } else if (value == 'edit') {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CheckModal(message: '작성한 공지를 수정하시겠습니까?', onConfirm: (){
                  ///todo 작성자가 아닐 시 수정 불가
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PuddingAdminNoticeEditPage()),
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