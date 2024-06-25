import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_mart/features/shop/screens/allProducts/all_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/customShapes/containers/circular_container.dart';
import '../../../../../common/widgets/image/trounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/banner_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    required this.banners, this.onPressed,
  });

  final List<String> banners; 
  final VoidCallback?onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    // final ProductController productController = Get.put(ProductController());
    // final product = productController.productList[0];
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((banner) => TRoundedImages(
            imageUrl: banner,
            onPressed: () => Get.to(()=> const AllProductScreen()),
          )).toList(),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  CircularContainer(
                    height: 4,
                    width: 20,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.grey,
                  ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
