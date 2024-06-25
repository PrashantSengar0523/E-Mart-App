import 'package:e_mart/common/widgets/customShapes/containers/trounded_container.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TPaymentMethod extends StatelessWidget {
  const TPaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(text: 'Payment method', buttonTitle: 'change', onPressed: (){},textColor: TColors.black,showActionButton: true,padding: const EdgeInsets.only(left: TSizes.xs),),
        const SizedBox(height: TSizes.spaceBtwItems/2,),
        

        Row(
          children: [
            const SizedBox(width: TSizes.spaceBtwItems/2,),
            const TRoundedContainer(
              // height: 60,
              width: 35,
              backgroundColor: TColors.light,
              padding: EdgeInsets.all(TSizes.sm),
              child: Image(image: AssetImage(TImages.paypal),fit: BoxFit.contain,),
            ),
            const SizedBox(width: TSizes.spaceBtwItems/2,),
            Text('Paypal',style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )
        
      ],
    );
  }
}