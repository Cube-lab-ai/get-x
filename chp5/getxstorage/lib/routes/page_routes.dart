import 'package:get/get_navigation/get_navigation.dart';
import 'package:getxstorage/bindings/cart_bindings.dart';
import 'package:getxstorage/bindings/product_bindings.dart';
import 'package:getxstorage/routes/routes.dart';
import 'package:getxstorage/views/cart_page.dart';
import 'package:getxstorage/views/check_out_page.dart';
import 'package:getxstorage/views/product_details_page.dart';
import 'package:getxstorage/views/product_page.dart';

class PageRoutes {
  static final routes = [
    GetPage(
      name: Routes.productPage,
      page: () {
        return ProductPage();
      },
      binding: ProductBindings(),
    ),
    GetPage(
      name: Routes.productDetails,
      page: () {
        return ProductDetailsPage();
      },
      binding: CartBindings(), // ensures CartController is available
    ),

    GetPage(
      name: Routes.cartPage,
      page: () {
        return CartPage();
      },
      binding: CartBindings(), // ensures CartController is available
    ),

    GetPage(
      name: Routes.checkOutPage,
      page: () {
        return CheckOutPage();
      },
      binding: CartBindings(), // ensures CartController is available
    ),
  ];
}
