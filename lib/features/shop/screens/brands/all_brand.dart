import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/products/branCard/t_brand_card.dart';
import 'package:e_mart/features/shop/screens/brands/brand_product.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../personalization/controllers/brand_controller.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BrandController brandController = Get.put(BrandController());
    return Scaffold(
        appBar: const TAppBar(
          title: Text('Brand'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TGridLayout(
                    itemCount: 6,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.brandList[index];
                      return TBrandCards(
                          showBorder: true,
                          name: brand.name,
                          productCount: brand.productCount,
                          imageUrl: brand.imageUrl,
                          onTap: () =>
                              Get.to(() => BrandProduct(brand: brand)));
                    })
              ],
            ),
          ),
        ));
  }
}
