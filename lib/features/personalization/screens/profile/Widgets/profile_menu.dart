import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key, this.icon=Iconsax.arrow_right_34, required this.title, required this.value, required this.onPressed,
  });
  final IconData icon;
  final String title,value;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(left:TSizes.defaultSpace,bottom: TSizes.defaultSpace),
        child: Row(
          children: [
            Expanded(flex: 3, child: Text(title, style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.darkGrey),)),
            Expanded(flex: 5, child: Text(value,style: Theme.of(context).textTheme.bodyMedium,)),
            Expanded(child: Icon(icon, size: 18,))
          ],
        ),
      ),
    );
  }
}