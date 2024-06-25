import 'package:e_mart/common/widgets/image/t_circular_image.dart';
import 'package:e_mart/common/widgets/products/product_price/product_price_text.dart';
import 'package:e_mart/common/widgets/text/brand_title_verified_icon.dart';
import 'package:e_mart/utils/constants/enums.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/customShapes/containers/trounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, this.sale, this.price, this.productTitle, this.brand, this.productActualPrice, this.productStatus, this.productLogo});
  final String ?sale;
  final String ?price;
  final String ?productTitle;
  final String?brand;
  final String?productActualPrice;
  final bool?productStatus;
  final String?productLogo;
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            //Rating & Reviews
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                sale??'30%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),
            
            //Sales & Price Tag
            TProductTextPrice(price:productActualPrice??'\$99',lineThrough: true,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            TProductTextPrice(price: price??'',isLarge: true,),
          ],
        ),

        
        
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),
        
        //Product Name
        Text(productTitle??'',style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),

        Row(
          children: [
        Text('Status',style: Theme.of(context).textTheme.bodySmall,),
        const SizedBox(width: TSizes.spaceBtwItems,),
        Text('In Stock',style: Theme.of(context).textTheme.bodyLarge,),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems/1.5,),
        Row(
          children: [
            TCircularImage(
              height: 24,
              width: 24,
              image: productLogo??'',
              ),
            TBrandTitleVerifiedIcon(title: brand??'',brandTextSize: TextSizes.medium,),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/1.5,),
      ],
    );
  }
}
