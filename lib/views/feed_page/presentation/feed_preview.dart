import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/data/models/feed_check.dart';
import 'package:pudding/common/data/service/feed_check.dart';
import 'package:pudding/views/feed_page/components/post.dart';
import 'package:pudding/views/feed_page/presentation/comment_write.dart';
import 'package:pudding/views/feed_page/presentation/feed_write.dart';

class PuddingFeedPreview extends StatefulWidget {
   const PuddingFeedPreview({super.key});

  @override
  State<PuddingFeedPreview> createState() => _PuddingFeedPreviewState();
}

class _PuddingFeedPreviewState extends State<PuddingFeedPreview> {
    String timeAgo(DateTime date) {
      final diff = DateTime.now().difference(date);

      if (diff.inMinutes < 1) return '방금 전';
      if (diff.inMinutes < 60) return '${diff.inMinutes}분 전';
      if(diff.inHours < 24) return '${diff.inHours}시간 전';
      return '${diff.inDays}일 전';
    }

    late Future<List<FeedCheck>> feedCheckFuture;
    
    @override
  void initState() {
    super.initState();
    feedCheckFuture = CheckFeed().feedCheck();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(
        title: '피드',
        leading: const SizedBox(),
      ),
      body: FutureBuilder<List<FeedCheck>>(
        future: feedCheckFuture,
        builder: (context, snapshot) {

          if (snapshot.hasData) {
            final feeds = snapshot.data!;

            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final feed = feeds[index];

                return PuddingPost(
                  postId: feed.postId,
                  username: feed.name,
                  time: timeAgo(feed.createdAt),
                  title: feed.title,
                  commentCount: feed.commentCount,
                  profileImg: feed.profileImgUrl ?? PuddingAssets.profile,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PuddingCommentWrite(postId: feed.postId,)));
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 20,);
              },
              itemCount: feeds.length,
            );
          }
          else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          else {
            return Center(child: CircularProgressIndicator());
          }
        }
      ),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () async {
          await Navigator.of(context,).push(
            MaterialPageRoute(builder: (context) => PuddingFeedWritePage()),
          );
          setState(() {
            feedCheckFuture = CheckFeed().feedCheck();
          });
        },
        backgroundColor: PuddingColor.main,
        child: Icon(Symbols.edit),
      ),
    );
  }
}
