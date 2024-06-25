import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_mart/features/shop/screens/allProducts/all_product.dart';
import 'package:e_mart/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_mart/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_mart/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/common/widgets/customShapes/containers/circular_container.dart';
import 'package:e_mart/common/widgets/customShapes/containers/search_container.dart';
import 'package:e_mart/common/widgets/customShapes/curvedEdges/curved_edge_widget.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../common/widgets/products/productCards/tPtoduct_card_vertical.dart';
import '../../../personalization/controllers/product_controller.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedEdgeWidget(
              backgroundColor: TColors.primary,
              child: Container(
                color: TColors.primary,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 360,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -150,
                        right: -250,
                        child: CircularContainer(
                          backgroundColor: TColors.textWhite.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        top: -150,
                        right: -350,
                        child: CircularContainer(
                          backgroundColor: TColors.textWhite.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        right: -250,
                        child: CircularContainer(
                          backgroundColor: TColors.textWhite.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        bottom: -150,
                        right: -350,
                        child: CircularContainer(
                          backgroundColor: TColors.textWhite.withOpacity(0.1),
                        ),
                      ),
                      const Column(
                        children: [
                          /// AppBar
                          THomeAppBar(),
                          SizedBox(height: TSizes.spaceBtwSections),

                          /// Search Bar
                          TSearchContainer(text: 'Search in Store'),
                          SizedBox(height: TSizes.spaceBtwSections),

                          /// Section Heading
                          TSectionHeading(
                            text: 'Popular Categories',
                            textColor: TColors.white,
                          ),
                          SizedBox(height: TSizes.spaceBtwItems),

                          /// Categories
                          THomeCategories(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Promo Sliders
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                      TImages.banner1,
                      TImages.banner4,
                      TImages.banner7,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// Section Heading
                  TSectionHeading(
                    text: 'Popular Products',
                    textColor: TColors.black,
                    onPressed: () => Get.to(() => const AllProductScreen()),
                    showActionButton: true,
                    padding: const EdgeInsets.all(TSizes.sm),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  // Popular Products
                  Obx(() {
                    if (productController.isLoading.value) {
                      return Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                    ),
                  );
                    } else if (productController.productList.isEmpty) {
                      return const Center(child: Text('No popular products available'));
                    } else {
                      return TGridLayout(
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
                        },
                      );
                    }
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
