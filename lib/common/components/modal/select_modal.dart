import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pudding/common/components/modal/item_modal.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/common/data/service/item_payment.dart';

class SelectModal extends StatelessWidget {
  const SelectModal({super.key});

  @override
  Widget build(BuildContext context) {
    final payment = ItemPaymentApi();
    return Dialog(
      backgroundColor: PuddingColor.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Text(
              '아이템을 선택하세요.',
              style: PuddingTextStyle.heading3.copyWith(
                color: PuddingColor.brown,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () async {
                  await payment.itemPayment('EGG');
                  Navigator.of(context).pop(true);
                 showDialog(context: context, builder: (BuildContext context){
                   return const ItemModal(svgPath: PuddingAssets.egg);
                 });
                },
                  child: SvgPicture.asset(PuddingAssets.egg)),
              GestureDetector(
                onTap: () async {
                  await payment.itemPayment('MILK');
                  Navigator.of(context).pop(true);
                  showDialog(context: context, builder: (BuildContext context){
                    return const ItemModal(svgPath: PuddingAssets.milk);
                  });
                },
                  child: SvgPicture.asset(PuddingAssets.milk)),
              GestureDetector(
                onTap: () async {
                  await payment.itemPayment('SUGAR');
                  Navigator.of(context).pop(true);
                  showDialog(context: context, builder: (BuildContext context){
                    return const ItemModal(svgPath: PuddingAssets.sugar,);
                  });
                },
                  child: SvgPicture.asset(PuddingAssets.sugar)),
            ],
          ),
          const SizedBox(height: 18,),
        ],
      ),
    );
  }
}
