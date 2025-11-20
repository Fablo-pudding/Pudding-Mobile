import 'package:flutter/material.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/birth_date.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/complete.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/gender_selcet.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/id_page.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/password.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/repassword.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/student_number.dart';


class PuddingPageView extends StatefulWidget {
  const PuddingPageView({super.key});

  @override
  State<PuddingPageView> createState() => _PuddingPageViewState();
}

class _PuddingPageViewState extends State<PuddingPageView> {
  PageController pageController = PageController(
    initialPage: 0,
  );

  void selectPage(int index) {
    pageController.jumpToPage(index);
    setState(() {});
  }

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: pageController,
      children: [
        SizedBox.expand(
          child: PuddingIdPage(
            next: () => selectPage(1),
          ),
        ),
        SizedBox.expand(
          child: PuddingSignUpBirthDate(
            next: () => selectPage(2),
            back: () => selectPage(0),
          ),
        ),
        SizedBox.expand(
          child: PuddingSignUpStudentNumber(
            next: () => selectPage(3),
            back: () => selectPage(1),
          ),
        ),
        SizedBox.expand(
          child: PuddingSignUpGenderSelect(
            next: () => selectPage(4),
            back: () => selectPage(2),
          ),
        ),
        SizedBox.expand(
          child: PuddingPassword(
            next: () => selectPage(5),
            back: () => selectPage(3),
          ),
        ),
        SizedBox.expand(
          child: PuddingRepassword(
            next: () => selectPage(6),
            back: () => selectPage(4),
          ),
        ),
        SizedBox.expand(
          child: PuddingComplete(),
        ),
      ],
    );
  }
}
