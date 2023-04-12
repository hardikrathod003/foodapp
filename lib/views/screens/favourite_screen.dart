import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/product_list_controller.dart';
import '../components/product_container.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  ProductListController productListController =
      Get.find<ProductListController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text(
                "Favourite Product",
                style: GoogleFonts.poppins(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            ),
            Obx(
              () => SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width / 2,
                  mainAxisExtent: 300,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int i) {
                    return productContainer(
                      productListController: productListController,
                      i: i,
                    );
                  },
                  childCount: productListController.favouriteProductList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
