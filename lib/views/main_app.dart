import 'package:flutter/material.dart';
import 'package:pudding/common/components/bottom_navigation_bar.dart';

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
    if (_currentIndex == index) {
      _navigatorKeys[index].currentState!.popUntil((route) => route.isFirst);
    } else {
      _navigatorKeys[index].currentState!.popUntil((route) => route.isFirst);
    }
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
                MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('메인 페이지'),),)),
          ),
          Navigator(
            key: _navigatorKeys[1],
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('피드 페이지'),),)),
          ),
          Navigator(
            key: _navigatorKeys[2],
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('랭킹 페이지'),),),),
          ),
          Navigator(
            key: _navigatorKeys[3],
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('냉장고 페이지'),),)),
          ),
          Navigator(
            key: _navigatorKeys[4],
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('마이 페이지'),),)),
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