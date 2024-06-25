import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/products/productCards/tPtoduct_card_vertical.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/personalization/controllers/product_controller.dart';
import 'package:e_mart/features/shop/models/category_model.dart';
import 'package:e_mart/features/shop/screens/allProducts/all_product.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/branCard/t_brand_showcase.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/product_model.dart';

class TTabCategories extends StatelessWidget {
  const TTabCategories({
    super.key,
    required this.category, this.product, this.brandImage, this.brandName, this.productCount, this.productImage101, this.productImage103, this.productImage105,
  });
  final CategoryModel category;
  final Product?product;
  final String?brandImage;
  final String?brandName;
  final int?productCount;
  final String?productImage101;
  final String?productImage103;
  final String?productImage105;
  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// --- Brands
                TBrandShowcase(
                  brandImage: brandImage,
                  brandName: brandName,
                  productCount: productCount,
                  images:  [
                    productImage101??'',
                    productImage103 ??'',
                    productImage105??''
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                /// --- Products
                TSectionHeading(
                  text: 'You might like',
                  onPressed: () =>Get.to(()=>const AllProductScreen()),
                  textColor: TColors.black,
                  showActionButton: true,
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),

                TGridLayout(
                    itemCount: productController.productList.length,
                    itemBuilder: (_, index) {
                      final product = productController.productList[index];
                      return TProductCardVertical(
                      product: product,
                      id: product.id,
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
                    }),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                )
              ],
            ),
          ),
        ]);
  }
}
