import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/common/widgets/customShapes/containers/search_container.dart';
import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:e_mart/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/shop/controllers/category_controller.dart';
import 'package:e_mart/features/shop/screens/brands/all_brand.dart';
import 'package:e_mart/features/shop/screens/brands/brand_product.dart';
import 'package:e_mart/features/shop/screens/cart/cart.dart';
import 'package:e_mart/features/shop/screens/store/Widgets/category_tab.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/products/branCard/t_brand_card.dart';
import '../../../personalization/controllers/brand_controller.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BrandController brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length, // Adjusted to match the number of tabs
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: false,
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [
            TCartCounterIcon(onPressed: () => Get.to(() => const CartScreen()))
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: TColors.white,
                expandedHeight: 350,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Search Bar
                         const TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                       const SizedBox(height: TSizes.spaceBtwSections),

                        /// Featured Brands
                        TSectionHeading(
                          text: 'Featured Brands',
                          showActionButton: true,
                          onPressed: () =>Get.to(()=>const AllBrandScreen()),
                          textColor: TColors.black,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                        /// Brands
                        Expanded(
                          child: TGridLayout(
                            itemCount: brandController.brandList.length,
                            mainAxisExtent: 60,
                            itemBuilder: (_, index) {
                              final brand = brandController.brandList[index];
                              return TBrandCards(
                                showBorder: true,
                                name: brand.name,
                                productCount: brand.productCount,
                                imageUrl: brand.imageUrl,
                                onTap: () {
                                  Get.to(()=>BrandProduct(brand: brand,));
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                bottom: TTabBar(
                  tabs: categories
                      .map((category) => Tab(
                            child: Text(category.name),
                          ))
                      .toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: categories
                .map((category) => TTabCategories(
                      productCount: category.productCount,
                      brandImage: category.productLogo,
                      productImage101: category.productImage101,
                      productImage103: category.productImage103,
                      productImage105: category.productImage105,
                      brandName: category.productBrand,
                      category: category,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
