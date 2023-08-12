
import 'dart:async';

import 'package:remote_kitchen_test/Model/item_model.dart';
import 'package:remote_kitchen_test/Services/API/Helper/base_service.dart';

class APICall with BaseService {
  void dispose() {}

  FutureOr<List<ItemModel>> itemListResponseFromAPI() async {
    return tryOrCatch<List<ItemModel>>(() async {
      final response = await dio.get(
        '/api/food/v1/menu/?locations=2'
      );
      return (response.data['results'][0]['menuitem_set'] as List).map((item) => ItemModel.fromJson(item)).toList();
    });
  }

  FutureOr<void> checkOutCart() async {
    return tryOrCatch<void>(() async {
      final response = await dio.post(
          '/api/food/v1/menu/?locations=2',
        data: {
          "opening_hours": [],
          "slug": "persian-rose-original-menu-48e0bad2",
          "title": "Persian rose original menu",
          "description": "",
          "restaurant": "22",
          "company": "27",
          "locations": [
            2
          ],
          "cuisine_types": []
        }
      );
    });
  }
}