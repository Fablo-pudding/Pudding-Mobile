import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/provider/auth.dart';
import 'package:pudding/views/main_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/src/framework.dart';

class PuddingLoginPage extends ConsumerStatefulWidget {
  final String id;
  final String password;

  const PuddingLoginPage({
    super.key,
    required this.id,
    required this.password,
  });

  @override
  ConsumerState<PuddingLoginPage> createState() => _PuddingLoginState();
}

class _PuddingLoginState extends ConsumerState<PuddingLoginPage> {
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
          idController.text.isNotEmpty && passwordController.text.length >= 8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: PuddingColor.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 32),
                        PuddingTextFormField(
                          controller: idController,
                          hintText: '아이디 입력',
                          title: '아이디',
                        ),
                        const SizedBox(height: 28),
                        PuddingTextFormField(
                          pwObsText: pwObsText,
                          controller: passwordController,
                          hintText: '비밀번호 입력',
                          title: '비밀번호',
                          maxLines: 1,
                          suffixIcon: GestureDetector(
                            onTap: () => setState(() => pwObsText = !pwObsText),
                            child: Icon(
                              pwObsText
                                  ? Symbols.visibility
                                  : Symbols.visibility_off,
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: PuddingElevatedButton(
                                onPressed: isEnabledButton
                                    ? () async {
                                        final auth = ref.read(authProvider);
                                        final succes = await auth.signIn(
                                          name: idController.text,
                                          password: passwordController.text,
                                        );
                                        if (succes) {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const PuddingMainApp(),
                                            ),
                                            (route) => false,
                                          );
                                        }
                                      }
                                    : null,
                                child: const Text('로그인'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
