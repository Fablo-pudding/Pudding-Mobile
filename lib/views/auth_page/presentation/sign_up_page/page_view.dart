import 'package:flutter/material.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/complete.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/id_page.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/password.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/repassword.dart';

enum Page {id,password,rePassword,complete}
class PuddingPageView extends StatefulWidget {
  const PuddingPageView({super.key});

  @override
  State<PuddingPageView> createState() => _PuddingPageViewState();
}

class _PuddingPageViewState extends State<PuddingPageView> {
 final PageController pageController = PageController(
    initialPage: 0,
  );
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
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        SizedBox.expand(
          child: PuddingIdPage(
            next: () => selectPage(Page.password),
          ),
        ),
        SizedBox.expand(
          child: PuddingPassword(
            password: password,
            next: (pwd){
              password = pwd;
              selectPage(Page.rePassword);},
            back: () => selectPage(Page.id),

          ),
        ),
        SizedBox.expand(
          child: PuddingRepassword(
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
