import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../Icons/t_circular_icon.dart';

class TProductQuantityWithAddandRemove extends StatelessWidget {
  const TProductQuantityWithAddandRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const TCircularIcon(
          icon: Iconsax.minus,
          size: TSizes.md,
          width: 32,
          height: 32,
          color: TColors.black,
          backgroundColor: TColors.light,
          ),
          const SizedBox(width: TSizes.spaceBtwItems,),
      Text('2',style: Theme.of(context).textTheme.titleSmall,),
      const SizedBox(width: TSizes.spaceBtwItems,),
        
      const TCircularIcon(
      icon: Iconsax.add,
      size: TSizes.md,
      width: 32,
      height: 32,
      color: TColors.black,
      backgroundColor: TColors.primary,
      ),
      ],
    );
  }
}
