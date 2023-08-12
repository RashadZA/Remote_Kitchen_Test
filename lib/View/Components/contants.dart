import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_kitchen_test/Utils/design_utils.dart';

bool isNullEmptyOrFalse(dynamic o) {
  if (o is Map<String, dynamic> || o is List<dynamic>) {
    return o == null || o.length == 0;
  }
  return o == null || o == false || o == "";
}

extension StringExtension on String {
  dynamic errorSnackBar() {
    Get
      ..closeAllSnackbars()
      ..snackbar(
        'Error !',
        this,
        backgroundColor: AppColors.redAccent,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
  }

  dynamic successSnackBar({void Function(GetSnackBar)? onTap}) {
    Get
      ..closeAllSnackbars()
      ..snackbar(
        'Success !',
        this,
        onTap: onTap,
        backgroundColor: AppColors.green,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
  }

  dynamic infoSnackBar() {
    Get
      ..closeAllSnackbars()
      ..snackbar(
        'Info !',
        this,
        colorText: AppColors.appTextPrimaryColor,
        backgroundColor: AppColors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      );
  }
}
