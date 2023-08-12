import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_kitchen_test/Model/item_model.dart';
import 'package:remote_kitchen_test/Utils/design_utils.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;
  final Function onTapAdd;
  ItemCard({Key? key, required this.item, required this.onTapAdd})
      : super(key: key);
  final double width = Get.width - (defaultAllPadding * 4);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: width,
          decoration: const BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(defaultBorderRadius)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: defaultAllPadding),
                width: width * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${item.name ?? ""}",
                      style: AppTextTheme.text14.copyWith(
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.visible),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${item.description ?? ""}",
                      style: AppTextTheme.text14.copyWith(
                          color: AppColors.grey,
                          fontWeight: FontWeight.w700,
                          overflow: TextOverflow.visible),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "CA\$${item.basePrice ?? ""}",
                      style: AppTextTheme.text18.copyWith(
                          fontWeight: FontWeight.w800,
                          overflow: TextOverflow.visible),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.primaryColor, // Background color
                      ),
                      onPressed: () => onTapAdd(),
                      child: Text(
                        "Add +",
                        style: AppTextTheme.text18.copyWith(
                            fontWeight: FontWeight.w800,
                            overflow: TextOverflow.visible,
                            color: AppColors.white),
                      ),
                    )
                  ],
                ),
              ),
              networkImage(
                  height: 150,
                  width: width * 0.3,
                  image: item.originalImage?.workingUrl)
            ],
          ),
        ).defaultContainer(),
        const SizedBox(
          height: defaultAllPadding,
        ),
      ],
    );
  }
}
