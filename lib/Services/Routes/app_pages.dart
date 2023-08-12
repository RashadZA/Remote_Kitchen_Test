import 'package:get/get.dart';
import 'package:remote_kitchen_test/Services/API/Service/api_call.dart';
import 'package:remote_kitchen_test/Services/API/Service/api_repositories.dart';
import 'package:remote_kitchen_test/View/Controllers/add_to_card_controller.dart';
import 'package:remote_kitchen_test/View/Controllers/card_controller.dart';
import 'package:remote_kitchen_test/View/Controllers/home_controller.dart';
import 'package:remote_kitchen_test/View/Screens/add_to_card_screen.dart';
import 'package:remote_kitchen_test/View/Screens/card_screen.dart';
import 'package:remote_kitchen_test/View/Screens/home_screen.dart';
import 'package:remote_kitchen_test/View/Screens/unknown_404_screen.dart';

part 'app_routes.dart';

class AppPages {
  static final unknownRoute = GetPage(
    name: _Paths.unknown404,
    page: () => const Unknown404Screen(),
  );
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeScreen(),
      binding: BindingsBuilder(
            () => Get.lazyPut<HomeController>(() => HomeController()),
      ),
      children: [
        GetPage(
          name: _Paths.addToCart,
          page: () => AddToCardScreen(),
          binding: BindingsBuilder(
                () => Get.lazyPut<AddToCardController>(() => AddToCardController()),
          ),
        ),
        GetPage(
          name: _Paths.cart,
          page: () => CardScreen(),
          binding: BindingsBuilder(
                () => Get.lazyPut<CardController>(() => CardController()),
          ),
        ),
      ],
    ),
  ];
}

class BindingsX {
  static BindingsBuilder initialBindigs() {
    return BindingsBuilder(() {
      Get.lazyPut<APIRepository>(() => APIRepository(), fenix: true);
      Get.lazyPut<APICall>(() => APICall(), fenix: true);
    });
  }
}
