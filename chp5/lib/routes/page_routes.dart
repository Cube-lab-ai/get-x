import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_state_management/bindings/cart_bindings.dart';
import 'package:getx_state_management/bindings/product_bindings.dart';
import 'package:getx_state_management/routes/routes.dart';
import 'package:getx_state_management/views/cart_page.dart';
import 'package:getx_state_management/views/check_out_page.dart';
import 'package:getx_state_management/views/product_details_page.dart';
import 'package:getx_state_management/views/product_page.dart';

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
      binding: CartBindings(),
    ),

    GetPage(
      name: Routes.cartPage,
      page: () {
        return CartPage();
      },
    ),

    GetPage(
      name: Routes.checkOutPage,
      page: () {
        return CheckOutPage();
      },
    ),
  ];
}
