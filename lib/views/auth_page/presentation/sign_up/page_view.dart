import 'package:flutter/material.dart';
import 'package:pudding/views/auth_page/presentation/sign_up/complete.dart';
import 'package:pudding/views/auth_page/presentation/sign_up/id_page.dart';
import 'package:pudding/views/auth_page/presentation/sign_up/password.dart';
import 'package:pudding/views/auth_page/presentation/sign_up/repassword.dart';


enum Page { id, password, rePassword, complete }

class PuddingPageView extends StatefulWidget {
  const PuddingPageView({super.key});

  @override
  State<PuddingPageView> createState() => _PuddingPageViewState();
}

class _PuddingPageViewState extends State<PuddingPageView> {
  final PageController pageController = PageController(
    initialPage: 0,
  );
  String id = '';
  String password = '';

  void selectPage(Page page) {
    pageController.jumpToPage(page.index);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {});
    });
  }
@override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        SizedBox.expand(
          child: PuddingIdPage(
            next: (id) {
              this.id = id;
              selectPage(Page.password);
            },
          ),
        ),
        SizedBox.expand(
          child: PuddingPassword(
            id: id,
            password: password,
            next: (pwd, id) {
              password = pwd;
              this.id = id;
              selectPage(Page.rePassword);
            },
            back: () => selectPage(Page.id),
          ),
        ),
        SizedBox.expand(
          child: PuddingRepassword(
            id: id,
            password: password,
            next: () => selectPage(Page.complete),
            back: () => selectPage(Page.password),
          ),
        ),
        SizedBox.expand(
          child: PuddingComplete(),
        ),
      ],
    );
  }
}
