import 'package:flutter/material.dart';
import 'package:pudding/views/auth_page/components/dropdown_button.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingSignUpBirthDate extends StatefulWidget {
  final void Function()? next;
  final void Function()? back;

  const PuddingSignUpBirthDate({super.key, this.next, this.back});

  @override
  State<PuddingSignUpBirthDate> createState() => _PuddingSignUpBirthDateState();
}

class _PuddingSignUpBirthDateState extends State<PuddingSignUpBirthDate> {
  bool choice = false;
  int? dropdownYear;
  int? dropdownMonth;
  int? dropdownDay;

  int dayChoice() {
    if (dropdownMonth == null) return 31;
    if (dropdownMonth == 2) {
      if (dropdownYear != null &&
          ((dropdownYear! % 4 == 0 && dropdownYear! % 100 != 0) ||
              dropdownYear! % 400 == 0)) {
        return 29;
      }
      return 28;
    }
    if (dropdownMonth == 4 ||
        dropdownMonth == 6 ||
        dropdownMonth == 9 ||
        dropdownMonth == 11) {
      return 30;
    } else {
      return 31;
    }
  }

  bool get choiceButton =>
      dropdownYear != null && dropdownMonth != null && dropdownDay != null;

  @override
  Widget build(BuildContext context) {
    if (dropdownDay != null && dropdownDay! > dayChoice()) {
      dropdownDay = null;
    }
    return Scaffold(
      backgroundColor: PuddingColor.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            const SizedBox(height: 32,),
              Text('생년월일', style: PuddingTextStyle.heading3,),
              const SizedBox(height: 12,),
              Row(
                children: [
                  Expanded(
                    child: PuddingDropdownButton(
                      dropdownButton: DropdownButtonType.years,
                      value: dropdownYear,
                      onChanged: (newValue) {
                        setState(() {
                          dropdownYear = newValue;
                          choice = true;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 33,),
                  Expanded(
                    child: PuddingDropdownButton(
                      dropdownButton: DropdownButtonType.months,
                      value: dropdownMonth,
                      onChanged: (newValue) {
                        setState(() {
                          dropdownMonth = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 33,),
                  Expanded(
                    child: PuddingDropdownButton(
                      dropdownButton: DropdownButtonType.days,
                      value: dropdownDay,
                      onChanged: (newValue) {
                        setState(() {
                          dropdownDay = newValue;
                        });
                      },
                    ),
                  ),
                ],
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
