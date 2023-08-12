import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_kitchen_test/Model/item_model.dart';
import 'package:remote_kitchen_test/Services/API/Helper/base_service.dart';
import 'package:remote_kitchen_test/Services/API/Service/api_call.dart';
import 'package:remote_kitchen_test/Utils/design_utils.dart';

class APIRepository {
  final APICall apiCall = Get.put(APICall());

  void dispose() {
    apiCall.dispose();
  }

  Future<List<ItemModel>> itemListResponseFromAPI() async {
    try {
      return await apiCall.itemListResponseFromAPI();
    } on FetchDataException catch (e) {
      "${e.message}".errorSnackBar();
    } catch (e) {
      debugPrint(e.toString());
    }
    return <ItemModel>[];
  }

  Future<void> checkOutCart() async {
    try {
      return await apiCall.checkOutCart();
    } on FetchDataException catch (e) {
      "${e.message}".errorSnackBar();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
