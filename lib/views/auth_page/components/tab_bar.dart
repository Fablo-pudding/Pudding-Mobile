import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/auth_page/presentation/sign_in/login_page.dart';
import 'package:pudding/views/auth_page/presentation/sign_up/page_view.dart';


class PuddingTab extends StatefulWidget {
  const PuddingTab({super.key});

  @override
  State<PuddingTab> createState() => _PuddingTabState();
}

class _PuddingTabState extends State<PuddingTab>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          TabBar(
            labelColor: PuddingColor.brown,
            unselectedLabelColor: PuddingColor.gray400,
            labelStyle: PuddingTextStyle.heading2,
            indicatorColor: PuddingColor.brown,
            indicatorWeight: 1,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const <Widget>[
              Tab(
                child: Text('로그인'),
              ),
              Tab(
                child: Text('회원가입'),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: const [
                Center(
                  child: PuddingLoginPage(id: '', password: '',),
                ),
                Center(
                  child: PuddingPageView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
