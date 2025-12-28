import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/views/auth_page/presentation/sign_up/pudding_title.dart';

class PuddingSplashPage extends StatefulWidget {
  const PuddingSplashPage({super.key});

  @override
  State<PuddingSplashPage> createState() => _PuddingSplashPageState();
}

class _PuddingSplashPageState extends State<PuddingSplashPage> {
  bool splash = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        setState(() {
          splash = false;
        });
        await Future.delayed(Duration(seconds: 3));
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const PuddingTitle()),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: SvgPicture.asset(PuddingAssets.puddingTitle)),
          ],
        ),
      ),
    );
  }
}
