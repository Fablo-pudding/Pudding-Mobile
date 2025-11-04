import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/views/ranking/components/high_ranking.dart';
import 'package:pudding/views/ranking/components/ranking.dart';
import 'package:pudding/common/constants/color.dart';

class PuddingRankingPage extends StatefulWidget {
  const PuddingRankingPage({super.key});

  @override
  State<PuddingRankingPage> createState() => _PuddingRankingPageState();
}

class _PuddingRankingPageState extends State<PuddingRankingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(
        title: '랭킹',
      ),
      body: Column(
        children: [
          const SizedBox(height:  37),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: PuddingHighRanking(
                    ranking: 2,
                    backgroundColor: PuddingColor.blue,
                    nickName: 'username',
                    puddingCounting: 40,
                    userImage: null,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: PuddingHighRanking(
                    ranking: 1,
                    backgroundColor: PuddingColor.gold,
                    nickName: 'username',
                    userImage: null,
                    puddingCounting: 45,
                    crown: 'assets/img/crown.svg',
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: PuddingHighRanking(
                    ranking: 3,
                    backgroundColor: PuddingColor.orange,
                    nickName: 'username',
                    userImage: null,
                    puddingCounting: 35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                      child: PuddingRanking(
                        ranking: index+4,
                        userName: 'userName',
                        puddingCount: index,
                        backgroudColor: PuddingColor.background,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          PuddingRanking(
            ranking: 2,
            userName: 'userName',
            puddingCount: 22,
            backgroudColor: PuddingColor.main,
          ),
        ],
      ),
    );
  }
}
