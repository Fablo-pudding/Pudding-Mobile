import 'package:flutter/material.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/auth_page/components/dropdown_button.dart';

class PuddingSignUpStudentNumber extends StatefulWidget {
  final void Function()? next;
  final void Function()? back;

  const PuddingSignUpStudentNumber({super.key, this.next, this.back});

  @override
  State<PuddingSignUpStudentNumber> createState() =>
      _PuddingSignUpStudentNumberState();
}

class _PuddingSignUpStudentNumberState
    extends State<PuddingSignUpStudentNumber> {
  TextEditingController classNumberController = TextEditingController();
  bool isEnabledButton = false;
  int? cardinalNumbers;

  @override
  void initState() {
    classNumberController.addListener(_onChangedButton);
    super.initState();
  }

  @override
  void dispose() {
    classNumberController.dispose();
    super.dispose();
  }

  void _onChangedButton() {
    setState(() {
      isEnabledButton = classNumberController.text.isNotEmpty;
    });
  }

  bool get choiceButton => cardinalNumbers != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32,),
              Text(
                '기수입력',
                style: PuddingTextStyle.heading3,
              ),
              const SizedBox(height: 4,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PuddingDropdownButton(
                  dropdownButton: DropdownButtonType.cardinalNumber,
                  value: cardinalNumbers,
                  onChanged: (newValues){
                    setState(() {
                      cardinalNumbers = newValues;
                      isEnabledButton = true;
                    });
                  },
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
                      onPressed: choiceButton
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
