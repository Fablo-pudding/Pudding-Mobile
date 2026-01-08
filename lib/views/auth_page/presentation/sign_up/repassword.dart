import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/views/auth_page/provider/auth.dart';

class PuddingRepassword extends ConsumerStatefulWidget {
  final String id;
  final String password;
  final void Function()? next;
  final void Function()? back;

  const PuddingRepassword({
    super.key,
    this.next,
    this.back,
    required this.id,
    required this.password,
  });

  @override
  ConsumerState<PuddingRepassword> createState() => _PuddingRepasswordState();
}

class _PuddingRepasswordState extends ConsumerState<PuddingRepassword> {
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
      isEnabledButton =
          passwordController.text.isNotEmpty &&
          passwordController.text == widget.password;
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
                hintText: '비밀번호 입력',
                title: '비밀번호 재입력',
                maxLines: 1,
                suffixIcon: GestureDetector(
                  onTap: () => setState(() => pwObsText = !pwObsText),
                  child: Icon(
                    pwObsText == true
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
                      onPressed: () {
                        widget.back?.call();
                      },
                      child: const Text('이전'),
                    ),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  Expanded(
                    child: PuddingElevatedButton(
                      onPressed: isEnabledButton
                          ? () async {
                              final auth = ref.read(authProvider);
                              final access = await auth.signUp(
                                name: widget.id,
                                password: widget.password,
                              );
                              if(access){
                                widget.next?.call();
                              }
                            }
                          : null,
                      child: const Text('다음'),
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
