import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:remote_kitchen_test/Services/Local%20DB/item_table.dart';
import 'package:remote_kitchen_test/Utils/design_utils.dart';

class AddToCardController extends GetxController {

  RxString itemID = "".obs;
  RxString imageURL = "".obs;

  RxString itemName = "".obs;

  RxString itemDescription = "".obs;

  RxString itemBasePrice = "".obs;

  RxDouble itemQuantity = 0.0.obs;

  RxDouble itemTotalBasePrice = 0.0.obs;

  TextEditingController itemQuantityController = TextEditingController();

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    itemID.value = Get.parameters['itemID'] ?? "";
    imageURL.value = Get.parameters['itemImageUrl'] ?? "";
    itemName.value = Get.parameters['itemName'] ?? "";
    itemDescription.value = Get.parameters['itemDescription'] ?? "";
    itemBasePrice.value = Get.parameters['itemBasePrice'] ?? "";
  }

  Future<void> addItemQuantity({required double itemQTY}) async {
    itemQuantity.value = itemQTY;
    itemTotalBasePrice.value = double.parse(itemBasePrice.value) * itemQTY;
    update();
  }

  Future<void> addItemInTable() async {
    if (!await requestPermission(Permission.storage)) {
      await requestPermission(Permission.storage);
    }
    try {
      if (itemQuantity.value > 0) {
        ItemTable().insertItemIntoTable(
            idOfItem: itemID.value,
            imageUrlOfItem: imageURL.value,
            nameOfItem: itemName.value,
            descriptionOfItem: itemDescription.value,
            quantityOfItem: itemQuantity.value.toString(),
            basePriceOfItem: itemBasePrice.value,
            totalPriceOfItem: itemTotalBasePrice.value.toString());
        Get.back();
        "Item has been added to your cart — ${itemQuantity.value} item(s)"
            .successSnackBar();
      } else {
        "Please add quantity".infoSnackBar();
      }
    } catch (e) {
      "$e".errorSnackBar();
    }
  }

  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else if (result == PermissionStatus.permanentlyDenied) {
        await openAppSettings();
      }
    }
    return false;
  }
}
