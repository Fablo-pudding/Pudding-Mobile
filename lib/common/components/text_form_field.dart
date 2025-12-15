import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';

class PuddingTextFormField extends StatelessWidget {
  final String? title;
  final bool pwObsText;
  final TextEditingController controller;
  final TextStyle? style;
  final TextAlign? textAlign;
  final InputDecoration? decoration;
  final void Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? cursorColor;
  final bool autocorrect;
  final TextInputType? keyboardType;
  final int? maxLength;
  final void Function(PointerDownEvent)? onTapOutSide;
  final String hintText;
  final Color? fillColor;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final bool? expands;
  final int? minLines;
  final int? maxLines;
  final bool? filled;
  final TextStyle? hintStyle;
  final bool? choiceEnableBorder;
  final bool? choiceFocusBorder;

  const PuddingTextFormField({
    super.key,
    this.title,
    this.pwObsText = false,
    required this.controller,
    this.style,
    this.textAlign,
    this.decoration = const InputDecoration(),
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.cursorColor,
    this.autocorrect = false,
    this.keyboardType,
    this.maxLength,
    this.onTapOutSide,
    required this.hintText,
    this.fillColor,
    this.focusNode,
    this.autovalidateMode,
    this.expands,
    this.minLines,
    this.maxLines,
    this.filled,
    this.choiceEnableBorder,
    this.choiceFocusBorder,
    this.hintStyle,
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = style ?? PuddingTextStyle.body1;
    final feedFocusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: PuddingColor.white),
    );
    final enableBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: PuddingColor.white),
    );

    final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: PuddingColor.brown, width: 1),
    );

    InputBorder selectFocusBorder;

    if (choiceFocusBorder == false) {
      selectFocusBorder = InputBorder.none;
    } else if (choiceFocusBorder == true) {
      selectFocusBorder = focusBorder;
    } else {
      selectFocusBorder = feedFocusBorder;
    }

    final selectEnabledBorder = choiceEnableBorder == false
        ? InputBorder.none
        : enableBorder;

    final cursorColor = this.cursorColor ?? PuddingColor.brown;
    final filledColor = this.fillColor ?? PuddingColor.white;
    InputDecoration? inputDecoration = decoration!.copyWith(
      errorBorder: InputBorder.none,
      focusedErrorBorder: focusBorder,
      enabledBorder: selectEnabledBorder,
      suffixIcon: suffixIcon,
      filled: filled ?? true,
      fillColor: filledColor,
      hintText: hintText,
      hintStyle: hintStyle,
      focusedBorder: selectFocusBorder,
      errorStyle: PuddingTextStyle.body3.copyWith(color: PuddingColor.red),
      counterText: '',
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) Text(title!, style: PuddingTextStyle.heading3),
        TextFormField(
          decoration: inputDecoration,
          style: style ?? defaultTextStyle,
          controller: controller,
          autocorrect: autocorrect,
          keyboardType: keyboardType,
          obscureText: pwObsText,
          validator: validator,
          cursorColor: cursorColor,
          maxLength: maxLength,
          autovalidateMode: autovalidateMode,
          textAlign: textAlign ?? TextAlign.start,
          minLines: minLines,
          maxLines: maxLines,
          focusNode: focusNode,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}