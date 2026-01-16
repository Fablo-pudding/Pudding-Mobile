import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/data/models/global_ranking.dart';
import 'package:pudding/common/data/models/my_ranking.dart';
import 'package:pudding/common/data/service/global_ranking.dart';
import 'package:pudding/common/data/service/my_ranking.dart';
import 'package:pudding/views/ranking_page/components/high_ranking.dart';
import 'package:pudding/views/ranking_page/components/ranking.dart';

class PuddingRankingPage extends StatefulWidget {
  const PuddingRankingPage({super.key});

  @override
  State<PuddingRankingPage> createState() => _PuddingRankingPageState();
}

class _PuddingRankingPageState extends State<PuddingRankingPage> {
  static const double width = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: const PuddingAppBar(
        title: '랭킹',
      ),
      body: FutureBuilder<List<dynamic>>(
        future: Future.wait([
          RankingApi().ranking(),
          MyRankingApi().myRanking(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            final List<GlobalRanking> globalRanking = snapshot.data![0];
            final MyRanking myRanking = snapshot.data![1];
            return Column(
              children: [
                const SizedBox(height: 37),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: PuddingHighRanking(
                          ranking: 2,
                          backgroundColor: PuddingColor.blue,
                          nickName: globalRanking[1].userName,
                          puddingCounting: globalRanking[1].pudding3,
                          userImage: null,
                        ),
                      ),
                      const SizedBox(
                        width: width,
                      ),
                      Expanded(
                        child: PuddingHighRanking(
                          ranking: 1,
                          backgroundColor: PuddingColor.gold,
                          nickName: globalRanking[0].userName,
                          userImage: null,
                          puddingCounting: globalRanking[0].pudding3,
                          crown: PuddingAssets.crown,
                        ),
                      ),
                      const SizedBox(
                        width: width,
                      ),
                      Expanded(
                        child: PuddingHighRanking(
                          ranking: 3,
                          backgroundColor: PuddingColor.orange,
                          nickName: globalRanking[2].userName,
                          userImage: null,
                          puddingCounting: globalRanking[2].pudding3,
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
                    itemCount: globalRanking.length - 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        children: [
                          Expanded(
                            child: PuddingRanking(
                              ranking: index + 4,
                              userName: globalRanking[index + 3].userName,
                              puddingCount: globalRanking[index + 3].pudding3,
                              backGroudColor: PuddingColor.background,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                PuddingRanking(
                  ranking: myRanking.rank,
                  userName: myRanking.userName,
                  puddingCount: myRanking.pudding3,
                  backGroudColor: PuddingColor.main,
                  userImage: PuddingAssets.profile,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            debugPrint('에러 ${snapshot.error}');
            return Center(child: Text('다시 시도해주세요'));
          }
          return Text('다시 시도해주세요');
        },
      ),
    );
  }
}
