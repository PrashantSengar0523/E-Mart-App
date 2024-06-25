import 'package:flutter/material.dart';

import '../../../../../common/widgets/customShapes/containers/trounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.only(top: TSizes.sm, bottom: TSizes.sm, left: TSizes.md, right: TSizes.md),
      backgroundColor: TColors.light,
      child: Row(
        children: [
            Flexible(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Have a Coupon Code? Enter here',
                  hintStyle: TextStyle(
                    fontSize: 12,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width: 80, child: ElevatedButton(onPressed: (){}, child: const Text('Apply'))),
        ],
      ),
    );
  }
}