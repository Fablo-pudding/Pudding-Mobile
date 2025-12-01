import 'package:flutter/material.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/birth_date.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/complete.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/gender_selcet.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/id_page.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/password.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/repassword.dart';
import 'package:pudding/views/auth_page/presentation/sign_up_page/student_number.dart';

enum Page {id, birthDate, studentNumber, genderSelect,password,rePassword,complete}
class PuddingPageView extends StatefulWidget {
  const PuddingPageView({super.key});

  @override
  State<PuddingPageView> createState() => _PuddingPageViewState();
}

class _PuddingPageViewState extends State<PuddingPageView> {
 final PageController pageController = PageController(
    initialPage: 0,
  );

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
            next: () => selectPage(Page.birthDate),
          ),
        ),
        SizedBox.expand(
          child: PuddingSignUpBirthDate(
            next: () => selectPage(Page.studentNumber),
            back: () => selectPage(Page.id),
          ),
        ),
        SizedBox.expand(
          child: PuddingSignUpStudentNumber(
            next: () => selectPage(Page.genderSelect),
            back: () => selectPage(Page.birthDate),
          ),
        ),
        SizedBox.expand(
          child: PuddingSignUpGenderSelect(
            next: () => selectPage(Page.password),
            back: () => selectPage(Page.studentNumber),
          ),
        ),
        SizedBox.expand(
          child: PuddingPassword(
            next: () => selectPage(Page.rePassword),
            back: () => selectPage(Page.genderSelect),
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
