import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

enum DropdownButtonType { years, months, days , cardinalNumber}

class PuddingDropdownButton extends StatelessWidget {
  final DropdownButtonType dropdownButton;
  final int? value;
  final ValueChanged<int?>? onChanged;
   PuddingDropdownButton({
    super.key,
    required this.dropdownButton,
    this.onChanged,
     this.value,
  });

  final List<int> dropdownYears = List.generate(
    DateTime.now().year - 2007,
        (index) => 2007 + index,
  ).take(3).toList();
  final List<int> dropdownMonths = List.generate(12, (index)=>index+1);
  final List<int> dropdownDays = List.generate(31, (index)=>index+1);
  final List<int> cardinalNumbers = List.generate(DateTime.now().year - 2015,(index)=>index+9).take(3).toList();


  Expanded puddingEnum(DropdownButtonType type) {
    switch (type) {
      case DropdownButtonType.years:
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: PuddingColor.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 36,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<int>(
                menuItemStyleData: const MenuItemStyleData(height: 28),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: PuddingColor.white,
                  ),
                  maxHeight: 124,
                ),
                isExpanded: true,
                isDense: true,
                hint: Text(
                  '년도',
                  style: PuddingTextStyle.body1.copyWith(
                    color: PuddingColor.gray400,
                  ),
                ),
                value: value,
                iconStyleData: const IconStyleData(
                  icon: Icon(Symbols.arrow_drop_down, size: 24),
                ),
                underline: const SizedBox.shrink(),
                style: PuddingTextStyle.body3.copyWith(
                  color: PuddingColor.black,
                ),
                onChanged: onChanged,
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
        );
      case DropdownButtonType.months:
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: PuddingColor.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 36,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<int>(
                menuItemStyleData: const MenuItemStyleData(height: 30),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: PuddingColor.white,
                  ),
                  maxHeight: 124,
                ),
                isExpanded: true,
                isDense: true,
                hint: Text(
                  '월',
                  style: PuddingTextStyle.body1.copyWith(
                    color: PuddingColor.gray400,
                  ),
                ),
                value: value,
                iconStyleData: const IconStyleData(
                  icon: Icon(Symbols.arrow_drop_down, size: 24),
                ),
                underline: const SizedBox.shrink(),
                style: PuddingTextStyle.body1.copyWith(
                  color: PuddingColor.black,
                ),
                onChanged: onChanged,
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
        );
      case DropdownButtonType.days:
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: PuddingColor.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 36,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<int>(
                menuItemStyleData: const MenuItemStyleData(height: 30),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: PuddingColor.white,
                  ),
                  maxHeight: 124,
                ),
                isExpanded: true,
                isDense: true,
                hint: Text(
                  '일',
                  style: PuddingTextStyle.body1.copyWith(
                    color: PuddingColor.gray400,
                  ),
                ),
                value: value,
                iconStyleData: const IconStyleData(
                  icon: Icon(Symbols.arrow_drop_down, size: 24),
                ),
                underline: const SizedBox.shrink(),
                style: PuddingTextStyle.body1.copyWith(
                  color: PuddingColor.black,
                ),
                onChanged: onChanged,
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
        );
      case DropdownButtonType.cardinalNumber:
        return Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: PuddingColor.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 48,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<int>(
                menuItemStyleData: const MenuItemStyleData(height: 34),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: PuddingColor.white,
                  ),
                  maxHeight: 124,
                ),
                isExpanded: true,
                isDense: true,
                hint: Text(
                  '기수 입력',
                  style: PuddingTextStyle.body1.copyWith(
                    color: PuddingColor.gray400,
                  ),
                ),
                value: value,
                iconStyleData: const IconStyleData(
                  icon: Icon(Symbols.arrow_drop_down, size: 24),
                ),
                underline: const SizedBox.shrink(),
                style: PuddingTextStyle.body1.copyWith(
                  color: PuddingColor.black,
                ),
                onChanged: onChanged,
                items: cardinalNumbers.map((day) {
                  return DropdownMenuItem<int>(
                    value: day,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${day.toString()}기',
                        style: PuddingTextStyle.body1.copyWith(
                          color: PuddingColor.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        puddingEnum(dropdownButton),
      ],
    );
  }
}
