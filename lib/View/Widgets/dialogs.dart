import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_kitchen_test/Utils/design_utils.dart';

class Dialogs {

  void statusDialog() {
    double height = Get.height * 0.5;
    double width = Get.width * 0.8;
    Get.dialog(
      Center(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Order ID",
                  style:
                      AppTextTheme.text14.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Static data. Tried the API but didn't work. Confuse about data format for sending data to API.",
                  style: AppTextTheme.text14.copyWith(
                      color: AppColors.grey, overflow: TextOverflow.visible),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Tracking Uri",
                  style:
                      AppTextTheme.text14.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Track the order",
                  style: AppTextTheme.text14.copyWith(
                      color: AppColors.grey, overflow: TextOverflow.visible),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Estimated Delivery Date",
                  style:
                      AppTextTheme.text14.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "7/19/2023, 11:35:55 PM",
                  style: AppTextTheme.text14.copyWith(
                      color: AppColors.grey, overflow: TextOverflow.visible),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Subtotal",
                  style:
                      AppTextTheme.text14.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "\$33",
                  style: AppTextTheme.text14.copyWith(
                      color: AppColors.grey, overflow: TextOverflow.visible),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "Delivery fee",
                  style:
                      AppTextTheme.text14.copyWith(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Text(
                  "975",
                  style: AppTextTheme.text14.copyWith(
                      color: AppColors.grey, overflow: TextOverflow.visible),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Center(
                  child: SizedBox(
                    height: height * 0.1,
                    width: width * 0.5,
                    child: TextButton(
                      onPressed: () => Get.back(),
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      child: Center(
                        child: Text(
                          close,
                          style: AppTextTheme.text14
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ).defaultContainer(),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
