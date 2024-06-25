import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/common/widgets/image/trounded_image.dart';
import 'package:e_mart/common/widgets/products/productCards/tproduct_card_horizontal.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/personalization/controllers/product_controller.dart';
import 'package:e_mart/features/shop/screens/allProducts/all_product.dart';
import 'package:e_mart/features/shop/screens/productDetails/product_detail.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen(
      {super.key,
      this.brand,
      this.image101,
      this.price101,
      this.title101,
      this.banner,
      this.sectionHeading1,
      this.image102,
      this.price102,
      this.title102,
      this.image103,
      this.price103,
      this.title103,
      this.image104,
      this.price104,
      this.title104,
      this.image105,
      this.price105,
      this.title105,
      this.image106,
      this.price106,
      this.title106,
      this.sectionHeading2,
      this.sectionHeading3,
       this.name,
      });
  final String?name;
  final String? brand;
  final String? image101;
  final String? price101;
  final String? title101;
  final String? image102;
  final String? price102;
  final String? title102;
  final String? image103;
  final String? price103;
  final String? title103;
  final String? image104;
  final String? price104;
  final String? title104;
  final String? image105;
  final String? price105;
  final String? title105;
  final String? image106;
  final String? price106;
  final String? title106;
  final String? sectionHeading1;
  final String? sectionHeading2;
  final String? sectionHeading3;
  final String? banner;
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: const TAppBar(
          title: Text('Sports'),
          showBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // for (var category in categoryController.featuredCategories) ...[
              TRoundedImages(
                imageUrl: banner ?? '',
                applyImageRadius: true,
                width: double.infinity,
              ),
              Column(
                children: [
                  _buildCategorySection(
                    sectionHeading: sectionHeading1,
                    products: [
                      Product(
                        image: image101,
                        title: title101,
                        price: price101,
                        brand: brand,
                        name: name,
                      ),
                      Product(
                        image: image102,
                        title: title102,
                        price: price102,
                        brand: brand,
                        name: name,
                      ),
                    ],
                  ),
                  _buildCategorySection(
                    sectionHeading: sectionHeading2,
                    products: [
                      Product(
                        image: image103,
                        title: title103,
                        price: price103,
                        brand: brand,
                        name: name,
                      ),
                      Product(
                        image: image104,
                        title: title104,
                        price: price104,
                        brand: brand,
                        name: name,
                      ),
                    ],
                  ),
                  _buildCategorySection(
                    sectionHeading: sectionHeading3,
                    products: [
                      Product(
                        image: image105,
                        title: title105,
                        price: price105,
                        brand: brand,
                        name: name,
                      ),
                      Product(
                        image: image106,
                        title: title106,
                        price: price106,
                        brand: brand,
                        name: name,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget _buildCategorySection({
    String? sectionHeading,
    required List<Product> products,
  }) {
    final ProductController productController = Get.put(ProductController());
    return Column(
      children: [
        TSectionHeading(
          text: sectionHeading ?? '',
          showActionButton: true,
          onPressed: () => Get.to(() => const AllProductScreen()),
          textColor: TColors.black,
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: SizedBox(
            height: 105,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              separatorBuilder: (_, __) =>
                  const SizedBox(width: TSizes.spaceBtwItems),
              itemBuilder: (context, index) {
                final product = productController.productList[index];
                return GestureDetector(
                onTap: () => Get.to(() => ProductDetailsScreen(
                      imageUrl: products[index].image??'',
                      productTitle: products[index].title,
                      price: products[index].price,
                      brand: products[index].brand,
                      productActualPrice: '99',
                      productDescription: '',
                      productLogo: '',
                      productRating: '3.8',
                      productReviews: '(1921)',
                      productType: products[index].name,
                      sale: '30%',
                      product: product,
                      
                    )),
                child: TProductHorizontalCart(
                  image: products[index].image,
                  title: products[index].title,
                  price: products[index].price,
                  brand: products[index].brand,
                ),
              );
              }
            ),
          ),
        ),
      ],
    );
  }
}

class Product {
  final String? image;
  final String? title;
  final String? price;
  final String? brand;
  final String?name;

  Product( {
    this.name,
    required this.image,
    required this.title,
    required this.price,
    required this.brand,
  });
}
