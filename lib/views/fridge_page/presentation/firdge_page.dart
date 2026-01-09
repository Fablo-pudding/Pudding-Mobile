import 'package:flutter/material.dart';
import 'package:pudding/common/components/app_bar/app_bar.dart';
import 'package:pudding/common/components/button/elevated_button.dart';
import 'package:pudding/common/components/modal/check_modal.dart';
import 'package:pudding/common/components/modal/lack_modal.dart';
import 'package:pudding/common/components/modal/select_modal.dart';
import 'package:pudding/common/components/modal/upgrade_modal.dart';
import 'package:pudding/common/constants/color.dart';
import 'package:pudding/common/constants/pudding_assets.dart';
import 'package:pudding/common/data/models/storage_info.dart';
import 'package:pudding/common/data/service/pudding_make.dart';
import 'package:pudding/views/fridge_page/components/ingredients_item.dart';
import 'package:pudding/views/fridge_page/components/pudding_star.dart';
import 'package:pudding/common/constants/api_endpoints.dart';
import 'package:pudding/common/data/service/fridge_info.dart';

class PuddingFridgePage extends StatefulWidget {
  const PuddingFridgePage({super.key});

  @override
  State<PuddingFridgePage> createState() => _PuddingFridgePageState();
}

class _PuddingFridgePageState extends State<PuddingFridgePage> {
  late Future<StorageInfo> fridgeFuture;

  @override
  void initState() {
    super.initState();
    fridgeFuture = FridgeInfo().fridgeInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PuddingColor.background,
      appBar: PuddingAppBar(title: '냉장고'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<StorageInfo>(
            future: fridgeFuture,
            builder: (context, snapshot) {

              if (snapshot.hasData) {
                return Column(
                  children: [
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              PuddingIngredientsItem(
                                svgPicture: PuddingAssets.egg,
                                ingredientsItem: snapshot.data!.egg,
                                width: double.infinity,
                                height: 180,
                                svgHeight: 96,
                              ),
                              const SizedBox(height: 20),
                              PuddingIngredientsItem(
                                svgPicture: PuddingAssets.sugar,
                                ingredientsItem: snapshot.data!.sugar,
                                width: double.infinity,
                                height: 150,
                                svgHeight: 80,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: PuddingIngredientsItem(
                            svgPicture: PuddingAssets.milk,
                            ingredientsItem: snapshot.data!.milk,
                            width: double.infinity,
                            height: 350,
                            svgHeight: 120,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    PuddingStar(
                      puddingCount: snapshot.data!.pudding1,
                      puddingCount2: snapshot.data!.pudding2,
                      puddingCount3: snapshot.data!.pudding3,
                    ),
                    const SizedBox(height: 66),
                    Row(
                      children: [
                        Expanded(
                          child: PuddingElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CheckModal(
                                    message: '재료를 사용하여 푸딩을 만드시겠습니까?',
                                    onConfirm: () async {
                                      try {

                                        await PuddingMake().puddingMake();
                                        setState(() {
                                          fridgeFuture = FridgeInfo().fridgeInfo();
                                        });

                                        Navigator.pop(context);

                                      } catch(e) {
                                        print(e);
                                        Navigator.pop(context);
                                        showDialog(
                                            context: context,
                                            // useRootNavigator: true,
                                            builder: (context) {
                                              return LackModal(message: '재료가 부족합니다.');
                                            }
                                        );
                                      }
                                    },
                                  );
                                },
                              );
                            },
                            child: const Text('푸딩 제작'),
                          ),
                        ),
                        const SizedBox(width: 22),
                        Expanded(
                          child: PuddingElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CheckModal(
                                    message: '푸딩을 강화하시겠습니까?',
                                    onConfirm: () {
                                      Navigator.of(context).pop();
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return UpgradeModal();
                                        },
                                      );
                                    },
                                  );
                                },
                              );
                            },
                            child: const Text('푸딩 강화'),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                );
              }
              else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }
              else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}