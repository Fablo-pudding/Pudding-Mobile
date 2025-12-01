import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';

class PuddingRepassword extends StatefulWidget {
  final void Function()? next;
  final void Function()? back;

  const PuddingRepassword({super.key, this.next, this.back});

  @override
  State<PuddingRepassword> createState() => _PuddingRepasswordState();
}

class _PuddingRepasswordState extends State<PuddingRepassword> {
  bool pwObsText = true;
  TextEditingController passwordController = TextEditingController();
  bool isEnabledButton = false;

  @override
  @override
  void initState() {
    passwordController.addListener(_onChanged);
    super.initState();
  }

  void _onChanged() {
    setState(() {
      isEnabledButton = passwordController.text.isNotEmpty;
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
            const SizedBox(height: 32,),
              PuddingTextFormField(
                pwObsText: pwObsText,
                controller: passwordController,
                hintText: '비밀번호 입력',
                title: '비밀번호 재입력',
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
                      onPressed: () {
                        widget.back?.call();
                      },
                      child: Text('이전'),
                    ),
                  ),
                  const SizedBox(width: 22,),
                  Expanded(
                    child: PuddingElevatedButton(
                      onPressed: isEnabledButton
                          ? () {
                              widget.next?.call();
                            }
                          : null,
                      child: Text('다음'),
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
