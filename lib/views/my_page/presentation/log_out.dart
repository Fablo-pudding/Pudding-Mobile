import 'package:flutter/material.dart';
import 'package:pudding/common/components/modal/check_modal.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/data/service/log_out.dart';
import 'package:pudding/views/auth_page/presentation/sign_up/pudding_title.dart';

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
      body: CheckModal(
        message: '로그아웃',
        onConfirm: () async {
          await LogOutApi().logOut();
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const PuddingTitle()),
            (route) => false,
          );
        },
        firstTextColor: PuddingColor.gray400,
        secondTextColor: PuddingColor.red,
      ),
    );
  }
}
