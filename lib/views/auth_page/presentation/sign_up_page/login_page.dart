import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/views/main_page/presentation/main_page.dart';

class PuddingLoginPage extends StatefulWidget {
  final VoidCallback? onNext;

  const PuddingLoginPage({super.key, this.onNext});

  @override
  State<PuddingLoginPage> createState() => _PuddingLoginState();
}

class _PuddingLoginState extends State<PuddingLoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isEnabledButton = false;
  bool pwObsText = true;

  @override
  void initState() {
    idController.addListener(_onChangedButton);
    passwordController.addListener(_onChangedButton);
    super.initState();
  }

  @override
  void dispose() {
    idController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _onChangedButton() {
    setState(() {
      isEnabledButton =
          idController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 32,),
                PuddingTextFormField(
                  controller: idController,
                  hintText: '아이디 입력',
                  title: '아이디',
                ),
                const SizedBox(height: 28,),
                PuddingTextFormField(
                  pwObsText: pwObsText,
                  controller: passwordController,
                  hintText: '비밀번호 입력',
                  title: '비밀번호',
                  suffixIcon: GestureDetector(
                    onTap: () => setState(() => pwObsText = !pwObsText),
                    child: Builder(
                      builder: (context) {
                        if (pwObsText) {
                          return const Icon(Symbols.visibility);
                        } else {
                          return const Icon(Symbols.visibility_off_rounded);
                        }
                      },
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: PuddingElevatedButton(
                        onPressed: isEnabledButton
                            ? () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PuddingMainPage(),
                            ),
                                (route) => false,
                          );
                        }
                            : null,
                        child: Text('로그인'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10,),
              ],
            ),
          ),
        ),
    );
  }
}