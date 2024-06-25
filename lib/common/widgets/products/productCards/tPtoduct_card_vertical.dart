import 'package:e_mart/common/styles/shadows.dart';
import 'package:e_mart/common/widgets/customShapes/containers/trounded_container.dart';
import 'package:e_mart/common/widgets/image/trounded_image.dart';
import 'package:e_mart/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:e_mart/common/widgets/products/product_price/product_price_text.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:e_mart/features/shop/screens/productDetails/product_detail.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../text/brand_title_verified_icon.dart';
import '../../text/tt_product_text.dart';

class TProductCardVertical extends StatelessWidget {
  // ignore: use_super_parameters
  const TProductCardVertical({
    super.key,
    this.imageUrls,
    this.saleText,
    this.productTitle,
    this.productBrand,
    this.productPrice,
    this.productDescription,
    this.productType,
    this.productRating,
    this.productActualPrice,
    this.productStatus,
    this.productLogo,
    this.productReviews,
    this.product,
    this.id,
  }) ;
  final String?id;
  final String? imageUrls;
  final String? saleText;
  final String? productTitle;
  final String? productBrand;
  final String? productPrice;
  final String? productDescription;
  final String? productType;
  final String? productRating;
  final String? productActualPrice;
  final bool? productStatus;
  final String? productLogo;
  final String? productReviews;

  final Product ?product;
  @override
  Widget build(BuildContext context) {
    

    return GestureDetector(
      onTap: () => Get.to(
        () => ProductDetailsScreen(
          product: product,
          productTitle:productTitle,
          imageUrl: imageUrls,
          price: productPrice,
          sale: saleText,
          brand: productBrand,
          productDescription: productDescription,
          productRating: productRating,
          productActualPrice: productActualPrice,
          productLogo: productLogo,
          productType: productType,
          productReviews: productReviews,
        ),
      ),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProduct],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.white,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 200,
              padding: const EdgeInsets.all(TSizes.xs),
              backgroundColor: TColors.light,
              child: Stack(
                children: [
                  TRoundedImages(
                    imageUrl: imageUrls ?? TImages.productImage60,
                    applyImageRadius: true,
                    backgroundColor: TColors.light,
                    isNetworkImage: true,
                  ),
                  Positioned(
                    top: 10,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      child: Text(
                        '$saleText %',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TFavouriteIcon(productId: product!.productTitle,),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductText(
                        title: productTitle ?? 'Product Title',
                        smallSize: true,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      TBrandTitleVerifiedIcon(
                        textAlign: TextAlign.start,
                        title: productBrand ?? 'Brand',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TProductTextPrice(price: productPrice ?? '10'),
                  // Container(
                  //   decoration: const BoxDecoration(
                  //     color: TColors.primary,
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(TSizes.cardRadiusMd),
                  //       bottomRight: Radius.circular(TSizes.productImageRadius),
                  //     ),
                  //   ),
                  //   child: const SizedBox(
                  //     width: TSizes.iconLg,
                  //     height: TSizes.iconLg,
                  //     child: Center(
                  //       child: Icon(Iconsax.add, color: TColors.white),
                  //     ),
                  //   ),
                  // ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
