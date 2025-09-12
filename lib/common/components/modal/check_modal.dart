import 'package:flutter/material.dart';
import 'package:pudding/common//constants/color.dart';
import 'package:pudding/common//constants/text_style.dart';

class CheckModal extends StatelessWidget {
  final String message;
  final VoidCallback onConfirm;

  const CheckModal({
    super.key,
    required this.message,
    required this.onConfirm
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: PuddingColor.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Text(
            message,
            style: PuddingTextStyle.heading2.copyWith(
              color: PuddingColor.black,
            ),
          ),
          const SizedBox(height: 50),
          const Divider(thickness: 1, height: 1, color: PuddingColor.gray400),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        '취소',
                        textAlign: TextAlign.center,
                        style: PuddingTextStyle.button.copyWith(
                          color: PuddingColor.red,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(width: 1, color: PuddingColor.gray400),
                Expanded(
                  child: GestureDetector(
                    onTap: onConfirm,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        '확인',
                        textAlign: TextAlign.center,
                        style: PuddingTextStyle.button.copyWith(
                          color: PuddingColor.brown,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
