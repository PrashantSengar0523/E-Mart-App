import 'package:e_mart/common/widgets/customShapes/containers/trounded_container.dart';
import 'package:e_mart/common/widgets/products/branCard/t_brand_card.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';


class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key, required this.images, this.brandImage, this.brandName, this.productCount,
  });

  final List<String> images;
  final String?brandImage;
  final String?brandName;
  final int?productCount;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          TBrandCards(
            imageUrl: brandImage,
            name: brandName,
            productCount: productCount,
            showBorder: true, 
          ),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Row(
            children: images.map((image) => brandTopProductImage(image, context)).toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImage(String image, BuildContext context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: NetworkImage(image),
        ),
      ),
    );
  }
}