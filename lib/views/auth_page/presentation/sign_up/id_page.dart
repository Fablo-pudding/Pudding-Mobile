import 'package:flutter/material.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';

class PuddingIdPage extends StatefulWidget {
  final void Function()? next;

  const PuddingIdPage({super.key, required this.next});

  @override
  State<PuddingIdPage> createState() => _PuddingIdPageState();
}

class _PuddingIdPageState extends State<PuddingIdPage> {
  final TextEditingController _idController = TextEditingController();
  bool isEnabledButton = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _idController.addListener(_onChangedButton);
    super.initState();
  }

  @override
  void dispose() {
    _idController.dispose();
    super.dispose();
  }

  void _onChangedButton() {
    setState(() {
      isEnabledButton = _idController.text.length >= 3
      ;
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
              Form(
                key: _formKey,
                child: PuddingTextFormField(
                  controller: _idController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  hintText: '3 ~ 12자 내 아이디 생성',
                  title: '아이디 생성',
                  maxLength: 12,
                  validator: (value) {
                    if (value == null || value.length < 3) {
                      return '3글자 이상 쳐주세요';
                    }
                    return null;
                  },
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: PuddingElevatedButton(
                      onPressed: isEnabledButton ? (){
                        if(_formKey.currentState!.validate()) {
                          widget.next?.call();
                        }
                      } : null,
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