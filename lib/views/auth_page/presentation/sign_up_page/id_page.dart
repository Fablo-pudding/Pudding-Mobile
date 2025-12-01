import 'package:flutter/material.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/components/text_form_field.dart';
import 'package:pudding/common/constants/color.dart';

class PuddingIdPage extends StatefulWidget {
  final void Function()? next;

  const PuddingIdPage({super.key, this.next});

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
      isEnabledButton = _idController.text.isNotEmpty;
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
                  hintText: '3 ~ 12자 내 아이디 생성',
                  title: '아이디 생성',
                  maxLength: 13,
                  validator: (value){
                    if(value!.length > 3){
                      return null;
                    }
                    if(value.length < 12){
                      return null;
                    }
                    return null;
                  },
                  countText: '',
                ),
              ),
              const Spacer(),
              Row(
                children: [
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
