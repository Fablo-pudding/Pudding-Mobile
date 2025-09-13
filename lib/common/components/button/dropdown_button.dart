import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingDropdownButton extends StatefulWidget {
  const PuddingDropdownButton({super.key});

  @override
  State<PuddingDropdownButton> createState() => _PuddingDropdownButtonState();
}

class _PuddingDropdownButtonState extends State<PuddingDropdownButton> {
  final List<int> dropdownYears = [2006, 2007, 2008, 2009];
  final List<int> dropdownMonths = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  final List<int> dropdownDays = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
  ];

  int? dropdownYear;
  int? dropdownMonth;
  int? dropdownDay;

  @override
  Widget build(BuildContext context) {

    int dayChoice() {
      if (dropdownMonth == 2) {
        if ((dropdownYear! % 4 == 0 && dropdownYear! % 100 != 0) || dropdownYear! % 400 == 0) {
          return 29;
        }
         return 28;
      }
      if (dropdownMonth == 4 || dropdownMonth == 6 || dropdownMonth == 9 || dropdownMonth == 11) {
        return 30;
      } else {
         return 31;
      }
    }
    if ((dropdownDay ?? 0) > dayChoice()) {
      dropdownDay = null;
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final margin = screenWidth * 0.03;
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: margin),
            decoration: BoxDecoration(
              color: PuddingColor.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 36,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<int>(
                menuItemStyleData: MenuItemStyleData(height: 37.5),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: PuddingColor.white,
                  ),
                  maxHeight: 145,
                ),
                isExpanded: true,
                isDense: true,
                hint: Text(
                  '년도',
                  style: PuddingTextStyle.body1.copyWith(
                    color: PuddingColor.gray400,
                  ),
                ),
                value: dropdownYear,
                iconStyleData: IconStyleData(
                  icon: Icon(Icons.arrow_drop_down, size: 24),
                ),
                underline: SizedBox.shrink(),
                style: PuddingTextStyle.body3.copyWith(
                  color: PuddingColor.black,
                ),
                onChanged: (int? newValue) {
                  setState(() {
                    dropdownYear = newValue;
                    dayChoice();
                  });
                },
                items: dropdownYears.map((year) {
                  return DropdownMenuItem<int>(
                    value: year,
                    child: Text(
                      year.toString(),
                      style: PuddingTextStyle.body1.copyWith(
                        color: PuddingColor.black,
                      ),
                      maxLines: 1,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: margin),
            decoration: BoxDecoration(
              color: PuddingColor.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 36,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<int>(
                menuItemStyleData: MenuItemStyleData(height: 37.5),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: PuddingColor.white,
                  ),
                  maxHeight: 145,
                ),
                isExpanded: true,
                isDense: true,
                hint: Text(
                  '월',
                  style: PuddingTextStyle.body1.copyWith(
                    color: PuddingColor.gray400,
                  ),
                ),
                value: dropdownMonth,
                iconStyleData: IconStyleData(
                  icon: Icon(Icons.arrow_drop_down, size: 24),
                ),
                underline: SizedBox.shrink(),
                style: PuddingTextStyle.body1.copyWith(
                  color: PuddingColor.black,
                ),
                onChanged: (int? newValue) {
                  setState(() {
                    dropdownMonth = newValue;
                    dayChoice();
                  });
                },
                items: dropdownMonths.map((month) {
                  return DropdownMenuItem<int>(
                    value: month,
                    child: Text(
                      month.toString(),
                      style: PuddingTextStyle.body1.copyWith(
                        color: PuddingColor.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: margin),
            decoration: BoxDecoration(
              color: PuddingColor.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 36,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<int>(
                menuItemStyleData: MenuItemStyleData(height: 37.5),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: PuddingColor.white,
                  ),
                  maxHeight: 145,
                ),
                isExpanded: true,
                isDense: true,
                hint: Text(
                  '일',
                  style: PuddingTextStyle.body1.copyWith(
                    color: PuddingColor.gray400,
                  ),
                ),
                value: dropdownDay,
                iconStyleData: IconStyleData(
                  icon: Icon(Icons.arrow_drop_down, size: 24),
                ),
                underline: SizedBox.shrink(),
                style: PuddingTextStyle.body1.copyWith(
                  color: PuddingColor.black,
                ),
                onChanged: (int? newValue) {
                  setState(() {
                    dropdownDay = newValue;
                    dayChoice();
                  });
                },
                items: dropdownDays.map((day) {
                  return DropdownMenuItem<int>(
                    value: day,
                    child: Text(
                      day.toString(),
                      style: PuddingTextStyle.body1.copyWith(
                        color: PuddingColor.black,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
