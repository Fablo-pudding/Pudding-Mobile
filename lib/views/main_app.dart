import 'package:flutter/material.dart';
import 'package:pudding/common/components/bottom_navigation_bar.dart';
import 'package:pudding/views/feed_page/presentation/feed_preview.dart';
import 'package:pudding/views/fridge_page/presentation/firdge_page.dart';
import 'package:pudding/views/main_page/presentation/main_page.dart';
import 'package:pudding/views/my_page/presentation/my_page.dart';
import 'package:pudding/views/ranking/presentaion/ranking_page.dart';

class PuddingMainApp extends StatefulWidget {
  const PuddingMainApp({super.key});
  
  @override
  _PuddingMainAppState createState() => _PuddingMainAppState();
}

class _PuddingMainAppState extends State<PuddingMainApp> {
  int _currentIndex = 0;

  final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  void _onTap(int index) {
    setState(() {
      if (_currentIndex == index) {
        _navigatorKeys[index].currentState!.popUntil((route) => route.isFirst);
      } else {
        _currentIndex = index;
      }
    });
  }

  /// TODO 페이지 구현 시 Scaffold -> 페이지로 교체
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Navigator(
            key: _navigatorKeys[0],
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (_) => Scaffold(body: PuddingMainPage(),)),
          ),
          Navigator(
            key: _navigatorKeys[1],
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (_) => Scaffold(body: PuddingFeedPreview())),
          ),
          Navigator(
            key: _navigatorKeys[2],
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (_) => Scaffold(body: PuddingRankingPage(),),),
          ),
          Navigator(
            key: _navigatorKeys[3],
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (_) => Scaffold(body: PuddingFridgePage())),
          ),
          Navigator(
            key: _navigatorKeys[4],
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (_) => Scaffold(body: PuddingMyPage())),
          ),
        ],
      ),
     bottomNavigationBar: PuddingBottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTap,
    ),
    );
  }
}