import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/shop/screens/productDetails/Widgets/bottom_add_to_cart.dart';
import 'package:e_mart/features/shop/screens/productDetails/Widgets/product_attribute.dart';
import 'package:e_mart/features/shop/screens/productDetails/Widgets/product_detail_image_slider.dart';
import 'package:e_mart/features/shop/screens/productDetails/Widgets/rating_share.dart';
import 'package:e_mart/features/shop/screens/productDetails/Widgets/tproduct_meta_data.dart';
import 'package:e_mart/features/shop/screens/productReviews/product_review_rating.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import '../../../../common/widgets/customShapes/containers/circular_container.dart';
import '../../../../common/widgets/customShapes/curvedEdges/curved_edge_widget.dart';
import '../../../../utils/constants/colors.dart';
import '../../controllers/cart_controller.dart';
import '../../models/cart_model.dart';
import '../../models/product_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    this.imageUrl,
    this.sale,
    this.price,
    this.productTitle,
    this.brand,
    this.productRating,
    this.productDescription,
    this.productActualPrice,
    this.productLogo,
    this.productType,
    this.productReviews,
    this.id,
    this.product,
  });

  final String? imageUrl;
  final String? sale;
  final String? price;
  final String? productTitle;
  final String? brand;
  final String? productRating;
  final String? productDescription;
  final String? productActualPrice;
  final String? productLogo;
  final String? productType;
  final String? productReviews;
  final String? id;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.put(CartController());
    final RxInt quantity = 1.obs;

    return Scaffold(
      bottomNavigationBar: Container(
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
                    if (quantity > 1) {
                      quantity.value--;
                    }
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(TColors.darkGrey),
                  ),
                  color: TColors.white,
                  icon: const Icon(Iconsax.minus),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Obx(() => Text(
                      '${quantity.value}',
                      style: Theme.of(context).textTheme.titleSmall,
                    )),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                IconButton.filled(
                  onPressed: () {
                    quantity.value++;
                  },
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(TColors.black),
                  ),
                  color: TColors.white,
                  icon: const Icon(Iconsax.add),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                cartController.addItem(CartModel(
                  productId: id ?? '',
                  title: productTitle ?? 'Unknown',
                  price: double.tryParse(price ?? '0') ?? 0.0,
                  image: imageUrl,
                  quantity: quantity.value,
                  variationId: 'default', // Assuming variationId is provided
                  brandName: brand,
                  selectedVariation: null, // Assuming selectedVariation is provided
                ));
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: const BorderSide(color: TColors.black),
              ),
              child: const Text('Add to Cart'),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedEdgeWidget(
              backgroundColor: TColors.primary,
              child: Container(
                color: TColors.light,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 350,
                  child: Stack(
                    children: [
                      Positioned(
                        top: -150,
                        right: -250,
                        child: CircularContainer(
                          backgroundColor: TColors.textWhite.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        top: -150,
                        right: -350,
                        child: CircularContainer(
                          backgroundColor: TColors.textWhite.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        top: 150,
                        right: -250,
                        child: CircularContainer(
                          backgroundColor: TColors.textWhite.withOpacity(0.1),
                        ),
                      ),
                      Positioned(
                        bottom: -150,
                        right: -350,
                        child: CircularContainer(
                          backgroundColor: TColors.textWhite.withOpacity(0.1),
                        ),
                      ),
                      // Product Image Slider
                      TImageSlider(
                        productId: id,
                        imageUrl: imageUrl ?? '',
                        product: product,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.md, vertical: TSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Rating and Review
                  TRatingAndShare(
                    productRating: productRating ?? '',
                    productReviews: productReviews ?? '',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Product Data
                  TProductMetaData(
                    sale: sale ?? '30%',
                    price: price ?? '0',
                    productTitle: productTitle ?? 'Unknown',
                    brand: brand ?? 'Unknown',
                    productActualPrice: productActualPrice ?? '99',
                    productLogo: productLogo ?? '',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Attributes
                  TProductAttributes(
                    variationPrice: price ?? '0',
                    productType: productType ?? 'Unknown',
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // Description
                  const TSectionHeading(
                    text: 'Description',
                    textColor: TColors.black,
                    padding: EdgeInsets.only(left: TSizes.xs),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    productDescription ?? 'No description available',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Reviews ${productReviews ?? '0'}',
                          style: Theme.of(context).textTheme.titleSmall),
                      IconButton(
                        onPressed: () => Get.to(() => ProductReviewScreen(
                              rating: productRating ?? '0',
                              reviews: productReviews ?? '0',
                            )),
                        icon: const Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  // const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
