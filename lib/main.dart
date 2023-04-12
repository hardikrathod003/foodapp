import 'package:flutter/material.dart';
import 'package:foodapp/views/screens/cart_screen.dart';
import 'package:foodapp/views/screens/detail_screen.dart';
import 'package:foodapp/views/screens/favourite_screen.dart';
import 'package:foodapp/views/screens/home_screen.dart';
import 'package:foodapp/views/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'controllers/db_helper.dart';
import 'controllers/product_list_controller.dart';
import 'views/screens/home_page.dart';

void main() async {
  final ProductListController productListController =
      Get.put(ProductListController());

  await ProductDBHelper.productDBHelper.insertData();

  productListController.setProductList();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash_screen",
      getPages: [
        GetPage(name: "/", page: () => HomePage()),
        GetPage(name: "/splash_screen", page: () => const SplashScreen()),
        GetPage(name: "/details_screen", page: () => DetailScreen()),
        GetPage(name: "/home_screen", page: () => HomeScreen()),
        GetPage(name: "/cart_screen", page: () => CartScreen()),
        GetPage(name: "/favourite_screen", page: () => FavoriteScreen()),
      ],
    ),
  );
}
