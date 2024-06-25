import 'package:e_mart/common/widgets/Icons/t_circular_icon.dart';
import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/loaders/loader_animation.dart';
import 'package:e_mart/features/shop/controllers/favourites_controller.dart';
import 'package:e_mart/navigation_menu.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/productCards/tPtoduct_card_vertical.dart';
import '../../../../utils/shimmer/veritical_product_shimmer.dart';
import '../../models/product_model.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;

    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.black),
        ),
        action: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(() {
                final future = controller.favouriteProduct();
                return FutureBuilder<List<Product>>(
                  future: future,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const TVerticalProductShimmer(itemCount: 4);
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return TAnimationLoader(
                        text: 'Whoops! Wishlist is Empty',
                        animation: TImages.pencilAnimation,
                        showAction: true,
                        actionText: "Let's add some",
                        onActionPressed: () => Get.offAll(() => const NavigationMenu()),
                      );
                    } else {
                      final products = snapshot.data!;
                      return TGridLayout(
                        itemCount: products.length,
                        itemBuilder: (_, index) {
                          final product = products[index];
                          return TProductCardVertical(
                            product: product,
                          );
                        },
                      );
                    }
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
