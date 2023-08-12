import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_kitchen_test/Services/Routes/app_pages.dart';
import 'package:remote_kitchen_test/Utils/design_utils.dart';
import 'package:remote_kitchen_test/View/Components/default_circular_progress_indicator.dart';
import 'package:remote_kitchen_test/View/Components/item_card.dart';
import 'package:remote_kitchen_test/View/Controllers/home_controller.dart';

class HomeScreen extends GetWidget<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            title,
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.cart)
                        ?.then((value) => controller.init());
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 40,
                  ),
                ),
                Obx(
                  () => controller.cartItemList.isNotEmpty
                      ? Positioned(
                          top: 0.0,
                          right: 8.0,
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppColors.green),
                            child: Center(
                              child: Text("${controller.cartItemList.length}",
                                  style: AppTextTheme.text12),
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            )
          ],
        ),
        body: Obx(
          () => controller.isLoading.isTrue
              ? Center(
                  child: const DefaultCircularProgressIndicator()
                      .defaultContainer(),
                )
              : RefreshIndicator(
                  onRefresh: () async {
                    controller.init();
                  },
                  child: controller.itemList.isNotEmpty
                      ? ListView.builder(
                          padding: const EdgeInsets.all(defaultAllPadding),
                          shrinkWrap: true,
                          itemCount: controller.itemList.length,
                          itemBuilder: (context, index) => ItemCard(
                            item: controller.itemList[index],
                            onTapAdd: () {
                              // Dialogs().addToCard( item: controller.itemList[index]);
                              Get.toNamed(
                                Routes.addToCart,
                                parameters: {
                                  "itemID":
                                      "${controller.itemList[index].id ?? ""}",
                                  "itemImageUrl":
                                      "${controller.itemList[index].originalImage?.workingUrl ?? ""}",
                                  "itemName":
                                      "${controller.itemList[index].name ?? ""}",
                                  "itemDescription":
                                      "${controller.itemList[index].description ?? ""}",
                                  "itemBasePrice":
                                      "${controller.itemList[index].basePrice ?? ""}",
                                },
                              )?.then((value) => controller.init());
                            },
                          ),
                        )
                      : Center(
                          child: SizedBox(
                            width: 200,
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  noDataFound,
                                  style: AppTextTheme.text16,
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors
                                          .primaryColor, // Background color
                                    ),
                                    onPressed: () {
                                      controller.init();
                                    },
                                    child: Text(
                                      refresh,
                                      style: AppTextTheme.text18.copyWith(
                                          fontWeight: FontWeight.w800,
                                          overflow: TextOverflow.visible,
                                          color: AppColors.white),
                                    ))
                              ],
                            ).defaultContainer(),
                          ),
                        ),
                ),
        ),
      ),
    );
  }
}
