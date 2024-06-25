import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.defaultSpace / 2, horizontal: TSizes.defaultSpace),
      decoration: const BoxDecoration(
        color: TColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton.filled(
                onPressed: () {
                },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(TColors.darkGrey)
                  ),
                  color: TColors.white,
                  icon: const Icon(Iconsax.minus)),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              Text(
                '2',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(
                width: TSizes.spaceBtwItems,
              ),
              IconButton.filled(
                onPressed: () {
                },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(TColors.black)
                  ),
                  color: TColors.white,
                  icon: const Icon(Iconsax.add)),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.black,
              side: const BorderSide(color: TColors.black)
            ),
            child: const Text('Add to Cart'),
          )
        ],
      ),
    );
  }
}
