import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAddress extends StatelessWidget {
  const TBillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(text: 'Shipping Address', buttonTitle: 'change', onPressed: (){},textColor: TColors.black,showActionButton: true,padding: const EdgeInsets.only(left: TSizes.xs),),
        Text(' Rudra',style: Theme.of(context).textTheme.bodyLarge,),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        Row(
          children: [
            const Icon(Icons.phone,size: 16,color: TColors.darkGrey,),
            const SizedBox(width: TSizes.spaceBtwItems/2,),
            Text('(+123) 456 7890',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems/2,),
                Row(
          children: [
            const Icon(Icons.location_history,size: 16,color: TColors.darkGrey,),
            const SizedBox(width: TSizes.spaceBtwItems/2,),
            Text('South Liana, Maine 74948, Russia',style: Theme.of(context).textTheme.bodyMedium,)
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems/2,),
      ],
    );
  }
}