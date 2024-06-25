import 'package:e_mart/common/widgets/customShapes/containers/trounded_container.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TOrderList extends StatelessWidget {
  const TOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) =>const SizedBox(height:TSizes.spaceBtwItems),
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder :(_,index)=> TRoundedContainer(
        showBorder: true,
        backgroundColor: TColors.light,
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.local_shipping_outlined),
                const SizedBox(width: TSizes.spaceBtwItems/2,),
      
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Processing',style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.primary, fontWeightDelta: 1),),
                      // const SizedBox(height: TSizes.spaceBtwItems/2,),
                      Text('09 Mar 2024',style: Theme.of(context).textTheme.titleSmall,),
                    ],
                  ),
                ),
                IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_34,size: TSizes.md,))
              ],
            ),
      
            const SizedBox(height: TSizes.spaceBtwItems,),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(width: TSizes.spaceBtwItems/2,),
                  
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order',style: Theme.of(context).textTheme.labelMedium),
                          // const SizedBox(height: TSizes.spaceBtwItems/2,),
                          Text('[#48023]',style: Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 1),),
                        ],
                      )
                    ],
                  ),
                ),
      
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calendar),
                      const SizedBox(width: TSizes.spaceBtwItems/2,),
                  
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Shipping date',style: Theme.of(context).textTheme.labelMedium),
                          // const SizedBox(height: TSizes.spaceBtwItems/2,),
                          Text('29 Mar 2024',style: Theme.of(context).textTheme.bodyLarge!.apply(fontWeightDelta: 1),),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ), 
    );
  }
}