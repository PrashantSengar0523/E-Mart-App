import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillinPrice extends StatelessWidget {
  const TBillinPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Price
        Row(
          children: [
            Expanded(child: Text('Subtotal',style: Theme.of(context).textTheme.bodyMedium,)),
            Text('\$256.0',style: Theme.of(context).textTheme.bodyMedium,),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),


        //shippin fee
        Row(
          children: [
            Expanded(child: Text('Shiiping fee',style: Theme.of(context).textTheme.bodyMedium,)),
            Text('\$6.0',style: Theme.of(context).textTheme.bodyMedium,),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        

        //Tax
        Row(
          children: [
            Expanded(child: Text('Tax charge',style: Theme.of(context).textTheme.bodyMedium,)),
            Text('\$6.0',style: Theme.of(context).textTheme.bodyMedium,),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),

        //Total
        Row(
          children: [
            Expanded(child: Text('Order Total',style: Theme.of(context).textTheme.bodyMedium,)),
            Text('\$300.0',style: Theme.of(context).textTheme.headlineSmall,),

          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
      ],
    );
  }
}