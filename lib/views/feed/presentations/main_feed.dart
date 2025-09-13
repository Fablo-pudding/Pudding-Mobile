import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/views/feed/components/post.dart';
import 'package:pudding/common/components/bottom_navigation_bar.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingMainFeed extends StatelessWidget {
  const PuddingMainFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PuddingAppBar(
        leftWidget: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Symbols.arrow_back_ios),
        ),
        title: '피드',
      ),
      body: Column(
        children: [

          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                return PuddingPost(
                  username: "username",
                  time: "time",
                  title: "title",
                  commentCount: 2,
                  profileImg: "",
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: PuddingColor.main,
        shape: const CircleBorder(),
        child: Icon(Symbols.mode, color: PuddingColor.brown),
      ),

      bottomNavigationBar: PuddingBottomNavigationBar(
        currentIndex: 1,
        onTap: (_) {},
      ),
    );
  }
}