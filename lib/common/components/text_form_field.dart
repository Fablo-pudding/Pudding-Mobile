import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';


class PuddingTextFormField extends StatelessWidget {
  final String? title;
  final bool? errorIcon;
  final bool pwObsText;
  final TextEditingController controller;
  final TextStyle? style;
  final TextAlign? textAlign;
  final InputDecoration? decoration;
  final void Function(String)? onchanged;
  final FormFieldValidator<String>? validator;
  final IconButton? suffixIcon;
  final IconButton? prefixIcon;
  final Color? cursorColor;
  final bool autocrrect;
  final TextInputType? keyboradType;
  final int? maxLength;
  final bool choiceEnableBorders;
  final void Function(PointerDownEvent)? onTapOutSide;

  const PuddingTextFormField({
    super.key,
    this.title,
    this.errorIcon = false,
    this.pwObsText = false,
    required this.controller,
    this.style,
    this.textAlign,
    this.decoration = const InputDecoration(),
    this.onchanged,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.cursorColor,
    required this.autocrrect,
    this.keyboradType,
    this.maxLength,
    this.choiceEnableBorders = true,
    this.onTapOutSide,
  });
  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = PuddingTextStyle.body1;
    final enableBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: PuddingColor.white, width: 1),
    );
   final enableBorder2 = Container(
     decoration: BoxDecoration(
       border: Border(
         top: BorderSide(color: PuddingColor.brown,width: 1),
         bottom:  BorderSide(color: PuddingColor.brown,width: 1),
       )
     ),
   );

final enableBorders = choiceEnableBorders ? enableBorder : enableBorder2;
    final focusBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: PuddingColor.black, width: 1),
    );
    final cousorColor = PuddingColor.brown;

    InputDecoration? inputDecoration = InputDecoration(
      hintText: decoration?.hintText,
      hintStyle: decoration?.hintStyle,
      errorText: decoration?.errorText,
      errorStyle: decoration?.errorStyle,
      icon: decoration?.icon,
      suffixIcon: decoration?.suffixIcon,
      prefixIcon: decoration?.prefixIcon,
      suffixStyle: decoration?.suffixStyle,
      prefixStyle: decoration?.prefixStyle,
      enabledBorder: enableBorder,
      focusedBorder: focusBorder,
      focusColor: decoration?.focusColor,
      fillColor: decoration?.fillColor,
      filled: true,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title!= null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(title!,style: PuddingTextStyle.heading3,),
          ),
        TextFormField(
          decoration: inputDecoration,
          style: defaultTextStyle,
          controller: controller,
          autocorrect: autocrrect,
          keyboardType: keyboradType,
          obscureText: pwObsText,
          validator: validator,
          cursorColor: cousorColor,
          maxLength: maxLength,
          onTapOutside:  (event) => FocusScope.of(context).unfocus(),
        ),
      ],
    );
  }
}
