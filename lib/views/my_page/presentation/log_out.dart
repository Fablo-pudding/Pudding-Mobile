import 'package:flutter/material.dart';
import 'package:pudding/common/components/modal/check_modal.dart';
import 'package:pudding/common/constants/color.dart';

class PuddingLogOut extends StatefulWidget {
  const PuddingLogOut({super.key});

  @override
  State<PuddingLogOut> createState() => _PuddingLogOutState();
}

class _PuddingLogOutState extends State<PuddingLogOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.gray400,
      body: CheckModal(message: '로그아웃', onConfirm: null,firstTextColor: PuddingColor.gray400,secondTextColor: PuddingColor.red,),
    );
  }
}
