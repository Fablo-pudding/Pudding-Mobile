import 'package:flutter/material.dart';
import 'package:pudding/common/components/profile/menu.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/constants/color.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PuddingMenu(menuName: '공지사항', iconButton: Icon(Symbols.arrow_forward_ios),borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)), textColor: PuddingColor.black,),
                PuddingMenu(menuName: '문의',iconButton: Icon(Symbols.arrow_forward_ios), textColor: PuddingColor.black,),
                PuddingMenu(menuName: '로그아웃',borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)), textColor: PuddingColor.red,),
              ],
            ),
          ),
        ),
    );
  }
}
