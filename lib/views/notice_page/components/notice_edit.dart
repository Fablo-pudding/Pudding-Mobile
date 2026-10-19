import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/modal/check_modal.dart';
import 'package:pudding/common/components/modal/lack_modal.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/common/data/models/notice_edit.dart';
import 'package:pudding/common/data/service/notice_delete.dart';
import 'package:pudding/common/data/service/notice_edit.dart';
import 'package:pudding/views/my_page/presentation/my_page.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_edit_page.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_page.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_watch_page.dart';
import 'package:pudding/views/notice_page/presentation/admin/admin_notice_write_page.dart';

class PuddingNoticeEdit extends StatefulWidget {
  final bool edit;
  final int postId;
  final NoticeEdit notice;

  const PuddingNoticeEdit({
    super.key,
    required this.edit,
    required this.postId,
    required this.notice,
  });

  @override
  State<PuddingNoticeEdit> createState() => _PuddingNoticeEditState();
}

class _PuddingNoticeEditState extends State<PuddingNoticeEdit> {

  @override
  Widget build(BuildContext context) {
    if(widget.edit == true) return const SizedBox();
    return PopupMenuButton<String>(
      constraints: const BoxConstraints(minWidth: 80),
      color: PuddingColor.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: PuddingColor.brown),
      ),
      icon: const Icon(
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
              return CheckModal(message: '작성한 공지를 삭제하시겠습니까?', onConfirm: ()async{
                if(mounted){
                  Navigator.of(context).pop();
                }
              if (mounted) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const PuddingMyPage()),
                );
                await NoticeDeleteApi().noticeDelete(widget.postId);
              }
              });
            },
          );
        } else if (value == 'edit') {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return CheckModal(
                message: '작성한 공지를 수정하시겠습니까?',
                onConfirm: () async {
                  try{
                    await NoticeEditApi().noticeEdits(widget.postId,widget.notice);
                  }
                  catch(e){
                    if (!mounted) return;
                    Navigator.pop(context);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return LackModal(
                          message: '작성자만 수정이 가능합니다.',
                        );
                      },
                    );
                  }
                  Navigator.of(context).pop();
                  if(mounted) {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PuddingAdminNoticeWritePage(edit: widget.notice,postId: widget.postId,)));
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
