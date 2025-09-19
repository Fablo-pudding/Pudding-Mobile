import 'package:flutter/material.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

enum PuddingTextField { signup, signin, write, comment }

class PuddingTextFormField extends StatefulWidget {
  final String hintText;
  final String? title;
  final PuddingTextField textField;

  const PuddingTextFormField({
    super.key,
    required this.hintText,
    this.title,
    required this.textField,
  });

  @override
  State<PuddingTextFormField> createState() => _PuddingTextFormFieldState();
}

class _PuddingTextFormFieldState extends State<PuddingTextFormField> {
  final _key = GlobalKey<FormState>();
  bool errorIcon = false;
  bool pwObsText = true;
  final signupController = TextEditingController();
  final signinpController = TextEditingController();
  final writeController = TextEditingController();
  final commentController = TextEditingController();

  @override
  void dispose() {
    signupController.dispose();
    signinpController.dispose();
    writeController.dispose();
    commentController.dispose();
    super.dispose();
  }

  final enableBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: PuddingColor.white, width: 1),
  );

  final focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(color: PuddingColor.black, width: 1),
  );

  final cousorColor = PuddingColor.brown;

  Widget puddingEnum(PuddingTextField type) {
    switch (type) {
      case PuddingTextField.signup:
        return TextFormField(
          style: PuddingTextStyle.body1,
          cursorColor: cousorColor,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: signupController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '아이디를 입력해주세요';
            }
            return null;
          },
          onChanged: (value) {
            setState(() {
              errorIcon = value.isEmpty;
            });
          },
          decoration: InputDecoration(
            enabledBorder: enableBorder,
            focusedBorder: focusBorder,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PuddingColor.white),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: PuddingColor.white),
            ),
            errorStyle: PuddingTextStyle.body3.copyWith(color: Colors.red),
            filled: true,
            fillColor: PuddingColor.white,
            hintText: widget.hintText,
            hintStyle: PuddingTextStyle.body1.copyWith(
              color: PuddingColor.gray400,
            ),
            suffixIcon: errorIcon
                ? IconButton(
                    onPressed: () {
                      signupController.clear();
                    },
                    icon: Icon(Symbols.cancel, color: Colors.red),
                  )
                : null,
          ),
        );
      case PuddingTextField.signin:
        return TextFormField(
          style: PuddingTextStyle.body1,
          cursorColor: cousorColor,
          obscureText: pwObsText,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: signinpController,
          decoration: InputDecoration(
            enabledBorder: enableBorder,
            focusedBorder: focusBorder,
            errorStyle: PuddingTextStyle.body3.copyWith(color: Colors.red),
            filled: true,
            fillColor: PuddingColor.white,
            hintText: widget.hintText,
            hintStyle: PuddingTextStyle.body1.copyWith(
              color: PuddingColor.gray400,
            ),
            suffixIcon: IconButton(
              onPressed: () => setState(() => pwObsText = !pwObsText),
              icon: Icon(
                pwObsText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
            ),
          ),
        );
      case PuddingTextField.write:
        return Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: PuddingColor.brown, width: 1),
              bottom: BorderSide(color: PuddingColor.brown, width: 1),
            ),
          ),
          child: TextFormField(
            cursorColor: cousorColor,
            controller: writeController,
            style: PuddingTextStyle.heading2,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 15.5,horizontal: 60),
              border: InputBorder.none,
              filled: true,
              fillColor: PuddingColor.background,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(Symbols.close,color: PuddingColor.brown,),
                padding: EdgeInsets.symmetric(horizontal: 20),
              ),
              hintText: widget.hintText,
              hintStyle: PuddingTextStyle.heading2.copyWith(
                color: PuddingColor.gray400,
              ),
            ),
          ),
        );
      case PuddingTextField.comment:
        return TextFormField(
          cursorColor: cousorColor,
          controller: commentController,
          style: PuddingTextStyle.body1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 13.5,horizontal: 20),
            enabledBorder: enableBorder,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: PuddingColor.white, width: 1),
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Symbols.keyboard_arrow_up,
                color: PuddingColor.gray400,
              ),
            ),
            filled: true,
            fillColor: PuddingColor.white,
            hintText: widget.hintText,
            hintStyle: PuddingTextStyle.body2.copyWith(
              color: PuddingColor.gray400,
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Text(widget.title!, style: PuddingTextStyle.heading3),
          const SizedBox(height: 8),
          puddingEnum(widget.textField),
        ],
      ),
    );
  }
}
