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
  final IconButton? suffixIcon;
  final IconButton? prefixIcon;
  final Color? cursorColor;
  final bool autocorrect;
  final TextInputType? keyboardType;
  final int? maxLength;
  final void Function(PointerDownEvent)? onTapOutSide;
  final String hintText;
  final Color? fillColor;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;

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
  });

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = style ?? PuddingTextStyle.body1;

    final enableBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: PuddingColor.white, width: 1),
    );

    final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: PuddingColor.brown, width: 1),);


    final cursorColor = this.cursorColor ?? PuddingColor.brown;
    final filledColor = this.fillColor ?? PuddingColor.white;
    InputDecoration? inputDecoration = decoration!.copyWith(
      errorBorder: InputBorder.none,
      focusedErrorBorder: focusBorder,
      enabledBorder: enableBorder,
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: filledColor,
      hintText: hintText,
      focusedBorder: focusBorder,
      errorStyle: TextStyle(height: 0, fontSize: 0),
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
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}
