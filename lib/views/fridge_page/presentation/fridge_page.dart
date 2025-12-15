import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/components/modal/check_modal.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/constants/text_style.dart';
import 'package:pudding/views/fridge_page/components/ingredient_item.dart';
class PuddingFridgePage extends StatelessWidget {
  const PuddingFridgePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PuddingAppBar(title: '냉장고'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IngredientItem(imgPath: PuddingAssets.egg, count: 2),
                IngredientItem(imgPath: PuddingAssets.milk, count: 2),
                IngredientItem(imgPath: PuddingAssets.sugar, count: 2),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: PuddingColor.main,
                  border: Border.all(color: PuddingColor.brown, width: 1),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 28,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: PuddingElevatedButton(
                              child: Text(
                                '푸딩 제작',
                                style: PuddingTextStyle.button.copyWith(
                                  color: PuddingColor.main,
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => CheckModal(
                                    message: '재료를 사용하여 푸딩을 만드시겠습니까?',
                                    onConfirm: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: PuddingElevatedButton(
                              child: Text(
                                '푸딩 강화',
                                style: PuddingTextStyle.button.copyWith(
                                  color: PuddingColor.main,
                                ),
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => CheckModal(
                                    message: '현재 강화 가능한 푸딩들을 강화하시겠습니까?',
                                    onConfirm: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: PuddingColor.brown,
                    ),
                    _buildInventoryGrid(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInventoryGrid() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: PuddingColor.background,
              borderRadius: BorderRadius.circular(20),
            ),
          );
        },
      ),
    );
  }
}
