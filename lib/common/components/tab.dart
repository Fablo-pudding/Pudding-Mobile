import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingTab extends StatefulWidget {
  const PuddingTab({super.key});

  @override
  State<PuddingTab> createState() => _PuddingTabState();
}

class _PuddingTabState extends State<PuddingTab>
with SingleTickerProviderStateMixin{
  late TabController controller;

  @override
  void initState(){
   super.initState();
   controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
            labelColor: PuddingColor.brown,
            unselectedLabelColor: PuddingColor.gray400,
            labelStyle: PuddingTextStyle.heading2,
            indicatorColor: PuddingColor.brown,
            indicatorWeight: 1,
            indicatorSize: TabBarIndicatorSize.tab,
            controller: controller,
                tabs: <Widget>[
          Tab(child: Text('로그인'),),
          Tab(child: Text('회원가입'),),
                ],
    );
  }
}