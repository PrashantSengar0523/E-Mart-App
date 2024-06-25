import 'package:e_mart/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_mart/features/shop/controllers/category_controller.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text_widget/vertical_text_image.dart';
import '../../subCategories/sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) {
        return const TCategoryShimmer();
      }
      if (categoryController.featuredCategories.isEmpty) {
        Center(
            child: Text(
          'No Data Found!',
          style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: TColors.white,
              ),
        ));
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featuredCategories[index];
            return TVerticalImageText(
              image: category.image,
              title: category.name,
              onTap: () {
                Get.to(() => SubCategoriesScreen(
                      name: category.name,
                      brand: category.productBrand,
                      banner: category.banner,
                      sectionHeading1: category.sectionHeading1,
                      image101: category.productImage101,
                      price101: category.productPrice101,
                      title101: category.productTitle101,
                      image102: category.productImage102,
                      price102: category.productPrice102,
                      title102: category.productTitle102,
                      sectionHeading2: category.sectionHeading2,
                      image103: category.productImage105,
                      price103: category.productPrice103,
                      title103: category.productTitle103,
                      image104: category.productImage106,
                      price104: category.productPrice104,
                      title104: category.productTitle104,
                      sectionHeading3: category.sectionHeading3,
                      image105: category.productImage103,
                      price105: category.productPrice105,
                      title105: category.productTitle105,
                      image106: category.productImage104,
                      price106: category.productPrice106,
                      title106: category.productTitle106,
                    ));
              },
            );
          },
        ),
      );
    });
  }
}
