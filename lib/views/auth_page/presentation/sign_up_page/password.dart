import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';

class PuddingPassword extends StatefulWidget {
  final void Function(String)? next;
  final void Function()? back;
  final String password;

  const PuddingPassword({
    super.key,
    this.next,
    this.back,
    required this.password,
  });

  @override
  State<PuddingPassword> createState() => _PuddingPasswordState();
}

class _PuddingPasswordState extends State<PuddingPassword> {
  TextEditingController passwordController = TextEditingController();
  bool pwObsText = true;
  bool isEnabledText = false;

  @override
  void initState() {
    passwordController.addListener(_onChanged);
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void _onChanged() {
    final input = passwordController.text.trim();
    final value = RegExp(r'^[0-9a-zA-Z_!#$*]+$').hasMatch(input);
    setState(() {
      isEnabledText = value && input.isNotEmpty;
      isEnabledText = passwordController.text.length >= 8;
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              PuddingTextFormField(
                pwObsText: pwObsText,
                controller: passwordController,
                hintText: '최소 8자, 영어 대소문자와 _#\$* 사용 가능',
                title: '비밀번호 생성',
                maxLines: 1,
                suffixIcon: GestureDetector(
                  onTap: () => setState(() => pwObsText = !pwObsText),
                  child: Icon(
                      pwObsText == true ? Symbols.visibility : Symbols.visibility_off
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return '3글자 이상 쳐주세요';
                  }
                  return null;
                },
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: PuddingElevatedButton(
                      onPressed: () {
                        widget.back?.call();
                      },
                      child: Text('이전'),
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  Expanded(
                    child: PuddingElevatedButton(
                      onPressed: isEnabledText
                          ? () {
                              widget.next?.call(passwordController.text);
                            }
                          : null,
                      child: Text('다음'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
