import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_state_management/routes/routes.dart';
import 'package:getx_state_management/views/product_view.dart';
import 'package:getx_state_management/views/second_page.dart';

class PageRoutes {
  static final routes = [
    GetPage(
      name: Routes.product,
      page: () {
        return ProductView();
      },
    ),
    GetPage(
      name: Routes.productDetails,
      page: () {
        return SecondPage();
      },
    ),
  ];
}
