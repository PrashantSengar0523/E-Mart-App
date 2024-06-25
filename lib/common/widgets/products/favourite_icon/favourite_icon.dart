import 'package:e_mart/common/widgets/Icons/t_circular_icon.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/favourites_controller.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key,
    required this.productId, // Make productId required and non-null
  });

  final String productId; // Declare productId as non-nullable

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(() => TCircularIcon(
          icon: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
          color: controller.isFavourite(productId) ? TColors.error : null,
          backgroundColor: TColors.light,
          onPressed: () => controller.toggleFavouriteProduct(productId),
        ));
  }
}
