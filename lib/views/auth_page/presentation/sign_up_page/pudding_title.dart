import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/auth_page/components/tab_bar.dart';

class PuddingTitle extends StatefulWidget {
  const PuddingTitle({super.key});

  @override
  State<PuddingTitle> createState() => _PuddingSignUpState();
}

class _PuddingSignUpState extends State<PuddingTitle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                'assets/img/pudding.svg',
                width: 110,
                height: 110,
              ),
            ),
            const SizedBox(height: 8,),
            Text(
              'pudding',
              style: PuddingTextStyle.lotteriaChab.copyWith(fontSize: 36),
            ),
            const SizedBox(height: 20,),
            Expanded(child: PuddingTab()),
          ],

    );
  }
}
