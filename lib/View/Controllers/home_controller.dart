import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:remote_kitchen_test/Model/item_model.dart';
import 'package:remote_kitchen_test/Services/API/Service/api_repositories.dart';
import 'package:remote_kitchen_test/Services/API/Service/internet.dart';
import 'package:remote_kitchen_test/Services/Local%20DB/item_table.dart';
import 'package:remote_kitchen_test/View/Components/contants.dart';

class HomeController extends GetxController {
  final APIRepository apiRepository = Get.find<APIRepository>();

  RxList<ItemModel> itemList = <ItemModel>[].obs;

  RxBool isLoading = false.obs;

  RxBool noInternet = false.obs;
  RxList cartItemList = [].obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    isLoading.value = true;
    if (!await requestPermission(Permission.storage)) {
      await requestPermission(Permission.storage);
    }
    await getData();
    isLoading.value = false;
  }

  Future<void> getData() async {
    cartItemList.value = await ItemTable().getItemsListFromTable();
    print("Cart Item Data: $cartItemList");
    if (!await Internet().isAvailable()) {
      "Internet isn't available".errorSnackBar();
    } else {
      itemList.value = await apiRepository.itemListResponseFromAPI();
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
