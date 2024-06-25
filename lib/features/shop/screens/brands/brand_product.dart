import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/app_bar.dart';
import '../../../../common/widgets/products/branCard/t_brand_card.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../personalization/controllers/brand_controller.dart';
import '../../../personalization/controllers/product_controller.dart';
import '../../models/brand_model.dart';


class BrandProduct extends StatelessWidget {
  const BrandProduct({super.key, required this.brand});
  final Brand brand;

  @override
  Widget build(BuildContext context) {
    final BrandController brandController = Get.find();
    final ProductController productController = Get.put(ProductController());

    // Fetch the products for the brand
    brandController.getBrandProducts(brand.name).then((products) {
      productController.updateProductList(products);
    });

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCards(
                showBorder: true,
                name: brand.name,
                imageUrl: brand.imageUrl,
                productCount: brand.productCount,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              const TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
