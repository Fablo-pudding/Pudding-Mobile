import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/views/feed_page/components/post.dart';
import 'package:pudding/views/feed_page/presentation/comment_write.dart';
import 'package:pudding/views/feed_page/presentation/feed_write.dart';

class PuddingFeedPreview extends StatefulWidget {
   const PuddingFeedPreview({super.key});

  @override
  State<PuddingFeedPreview> createState() => _PuddingFeedPreviewState();
}

class _PuddingFeedPreviewState extends State<PuddingFeedPreview> {
  final DateTime dateTime = DateTime.now();

   String get dateTimeFormat => DateFormat('mm').format(dateTime);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(
        title: '피드',
        leading: SizedBox(),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return PuddingPost(
            username: '최승우',
            time: dateTimeFormat,
            title: '안녕하세요',
            commentCount: 2,
            profileImg: PuddingAssets.profile,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemCount: 100,
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.of(context,).push(
            MaterialPageRoute(builder: (context) => PuddingFeedWritePage()),
          );
        },
        backgroundColor: PuddingColor.main,
        child: Icon(Symbols.edit),
      ),
    );
  }
}
