import 'package:e_mart/common/widgets/Icons/t_circular_icon.dart';
import 'package:e_mart/common/widgets/customShapes/containers/trounded_container.dart';
import 'package:e_mart/common/widgets/image/trounded_image.dart';
import 'package:e_mart/common/widgets/products/product_price/product_price_text.dart';
import 'package:e_mart/common/widgets/text/brand_title_verified_icon.dart';
import 'package:e_mart/common/widgets/text/tt_product_text.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';


class TProductHorizontalCart extends StatelessWidget {
  const TProductHorizontalCart({super.key, this.image, this.title, this.price, this.brand,});
  final String?image;
  final String?title;
  final String?price;
  final String?brand; 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: TColors.softGrey
        // boxShadow: [TShadowStyle.horizontalProduct],
      ),
      child: Row(
        children: [
          TRoundedContainer(
            showBorder: true,
            height: 100,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: TColors.white,
            child: Stack(
              children: [
                SizedBox(
                  width: 118,
                  height: 120,
                  child: TRoundedImages(
                    imageUrl: image??'',
                    applyImageRadius: true,
                    backgroundColor: TColors.white,
                  ),
                ),
                Positioned(
                  top: 0,
                  child: TRoundedContainer(
                    height: 25,
                    width: 35,
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.xs, vertical: TSizes.xs),
                    child: Text(
                      "30%",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                ),
                const Positioned(
                  top: -8,
                  right: -5,
                  child: TCircularIcon(icon: Iconsax.heart,backgroundColor: TColors.white,),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(left: TSizes.sm, top: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductText(
                    title: title??'',
                    smallSize: true,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleVerifiedIcon(title: brand??'',textColor: TColors.darkGrey,),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      TProductTextPrice(price: price??''),
                      // Container(
                      //     decoration:const BoxDecoration(
                      //       color: TColors.dark,
                      //       borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(TSizes.cardRadiusMd),
                      //         bottomRight: Radius.circular(TSizes.productImageRadius)
                      //       ),
                      //     ),
                      //     child: const SizedBox(
                      //       width: TSizes.iconLg*1,
                      //       height: TSizes.iconLg*1,
                      //       child: Center(child: Icon(Iconsax.add,color: TColors.white,))),
                      //   )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
