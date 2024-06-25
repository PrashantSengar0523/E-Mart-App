import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/personalization/controllers/product_controller.dart';
import '../../../../utils/constants/sizes.dart';
import '../../layouts/grid_layout.dart';
import '../productCards/tPtoduct_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Column(
      children: [
        Obx(() => DropdownButtonFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
            hintText: 'Select from Dropdown list',
          ),
          value: productController.selectedSortingOption.value,
          items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Popular']
            .map((options) =>
              DropdownMenuItem(value: options, child: Text(options)))
            .toList(),
          onChanged: (value) {
            if (value != null) {
              productController.updateSortingOption(value);
            }
          }
        )),
        const SizedBox(height: TSizes.spaceBtwSections),
        Obx(() => TGridLayout(
          itemCount: productController.productList.length,
          itemBuilder: (_, index) {
            final product = productController.productList[index];
            return TProductCardVertical(
              product: product,
              imageUrls: product.imageUrls,
              saleText: product.saleText,
              productBrand: product.productBrand,
              productPrice: product.productPrice,
              productTitle: product.productTitle,
              productRating: product.productRating,
              productActualPrice: product.productActualPrice,
              productDescription: product.productDescription,
              productStatus: product.productStatus,
              productType: product.productType,
              productLogo: product.productLogo,
              productReviews: product.productReviews,
            );
          }
        )),
      ],
    );
  }
}
