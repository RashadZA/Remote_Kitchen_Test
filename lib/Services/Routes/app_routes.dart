part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const unknown404 = _Paths.unknown404;
  static const home = _Paths.home;
  static const addToCart = home + _Paths.addToCart;
  static const cart = home + _Paths.cart;
}

abstract class _Paths {
  static const unknown404 = '/404';
  static const home = '/home';
  static const addToCart = '/addToCart';
  static const cart = '/cart';

}