import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../image/trounded_image.dart';
import '../../text/brand_title_verified_icon.dart';
import '../../text/tt_product_text.dart';


class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TRoundedImages(
          width: 60,
          height: 60,
          backgroundColor: TColors.light,
          padding: EdgeInsets.all(TSizes.sm),
          imageUrl: TImages.productImage1),
    
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TBrandTitleVerifiedIcon(title: 'Nike',),
                const Flexible(child:  TProductText(title: 'Sports shoes ',maxLines: 1,)),
            
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Color: ',style:Theme.of(context).textTheme.bodySmall!.apply(color: TColors.darkGrey) 
                      ),
            
                      TextSpan(
                        text: 'Green ',style: Theme.of(context).textTheme.bodyLarge
                      ),
            
                      TextSpan(
                        text: 'Size: ',style:Theme.of(context).textTheme.bodySmall!.apply(color: TColors.darkGrey) 
                      ),
            
                      TextSpan(
                        text: 'UK 6',style: Theme.of(context).textTheme.bodyLarge
                      )
                    ]
                  )
                )
              ],
            ),
          )
      ],
    );
  }
}