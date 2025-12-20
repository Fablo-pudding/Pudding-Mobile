import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/components/modal/check_modal.dart';
import 'package:pudding/common/components/modal/item_modal.dart';
import 'package:pudding/common/components/modal/upgrade_modal.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/views/fridge_page/components/ingredients_item.dart';
import 'package:pudding/views/fridge_page/components/pudding_star.dart';

class PuddingFridgePage extends StatelessWidget {
  const PuddingFridgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(title: '냉장고'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        PuddingIngredientsItem(
                          svgPicture: PuddingAssets.egg,
                          ingredientsItem: 32,
                          width: double.infinity,
                          height: 190,
                        ),
                        const SizedBox(height: 20),
                        PuddingIngredientsItem(
                          svgPicture: PuddingAssets.sugar,
                          ingredientsItem: 32,
                          width: double.infinity,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: PuddingIngredientsItem(
                      svgPicture: PuddingAssets.milk,
                      ingredientsItem: 32,
                      width: double.infinity,
                      height: 360,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              PuddingStar(
                puddingCount: 2,
                puddingCount2: 3,
                puddingCount3: 4,
              ),
              const SizedBox(height: 66),
              Row(
                children: [
                  Expanded(
                    child: PuddingElevatedButton(
                      onPressed: () {
                        showDialog(context: context, builder: (BuildContext context){
                          return CheckModal(message: '재료를 사용하여 푸딩을 만드시겠습니까?', onConfirm: (){});
                        });
                      },
                      child: const Text('푸딩 제작'),
                    ),
                  ),
                  const SizedBox(width: 22),
                  Expanded(
                    child: PuddingElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context, builder: (BuildContext context) {
                          return CheckModal(
                              message: '푸딩을 강화하시겠습니까?', onConfirm: () {
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>UpgradeModal()));
                            });
                          });
                      },
                      child: const Text('푸딩 강화'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
