import 'package:e_mart/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:e_mart/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/app_bar.dart';
import '../../../../../utils/constants/sizes.dart';

class TImageSlider extends StatelessWidget {
  const TImageSlider({
    super.key,
    this.imageUrl,
    this.product, this.productId,
  });
  final String? imageUrl;
  final String? productId;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TAppBar(
          showBackArrow: true,
          action: [TFavouriteIcon(productId: product!.imageUrls)],
        ),
        SizedBox(
          height: 250,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Center(
              child: Image(
                      image: NetworkImage(imageUrl??''),
                    )
                  // : const Icon(Icons.image, size: 100),
            ),
          ),
        ),
        /// Image Slider
        // SizedBox(
        //   height: 140,
        //   child: ListView.separated(
        //     itemCount: 4,
        //     shrinkWrap: true,
        //     scrollDirection: Axis.horizontal,
        //     physics: const AlwaysScrollableScrollPhysics(),
        //     separatorBuilder: (_, __) => const SizedBox(width: 10),
        //     itemBuilder: (_, index) => Container(
        //       width: 100,
        //       padding: const EdgeInsets.all(TSizes.sm),
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         border: Border.all(color: Colors.blue), // Adjust the border color as needed
        //         borderRadius: BorderRadius.circular(10), // Adjust the border radius as needed
        //       ),
        //       child: Image(
        //         image: NetworkImage(imageUrl as String),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}