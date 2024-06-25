import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/common/widgets/listTiles/setting_menu_tile.dart';
import 'package:e_mart/common/widgets/text/section_heading.dart';
import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/features/personalization/screens/addresses/address.dart';
import 'package:e_mart/features/personalization/screens/profile/profile_screen.dart';
import 'package:e_mart/features/shop/screens/cart/cart.dart';
import 'package:e_mart/features/shop/screens/order/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/customShapes/containers/circular_container.dart';
import '../../../../common/widgets/customShapes/curvedEdges/curved_edge_widget.dart';
import '../../../../common/widgets/listTiles/profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CurvedEdgeWidget(
              backgroundColor: TColors.primary,
              child: Container(
                color: TColors.primary,
                padding: const EdgeInsets.all(0),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///AppBar
                        TAppBar(
                          title: Text(
                            'Account',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .apply(color: TColors.white),
                          ),
                        ),

                        TUserProfileTile(onPressed: () {
                          Get.to(() => const ProfileScreen());
                        }),
                        const SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            ///---Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  ///Account Setting Heading
                  const TSectionHeading(
                    text: 'Account Setting',
                    textColor: TColors.black,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  ///Account Menu
                  TSettingMenutile(
                      onTap: () => Get.to(()=>const AddressScreen()),
                      title: 'My Address',
                      subtile: 'Add your address for delivery',
                      icon: Iconsax.safe_home),
                  TSettingMenutile(
                      onTap: () =>Get.to(()=>const OrderScreen()),
                      title: 'My Orders',
                      subtile: 'Track your orders and checkout',
                      icon: Iconsax.shopping_cart),
                  TSettingMenutile(
                      onTap: () =>Get.to(()=>const CartScreen()) ,
                      title: 'My Cart',
                      subtile: 'Add, remove products and move to cart',
                      icon: Iconsax.bag_tick),
                  const TSettingMenutile(
                      title: 'My Coupons',
                      subtile: 'List of discounted coupons',
                      icon: Iconsax.discount_shape),
                  const TSettingMenutile(
                      title: 'Bank Account',
                      subtile: 'Withdraw balance to registered account',
                      icon: Iconsax.bank),
                  const TSettingMenutile(
                      title: 'NotifiCation',
                      subtile: 'Check and set as default',
                      icon: Iconsax.notification),
                  const TSettingMenutile(
                      title: 'Account Privacy',
                      subtile: 'Manage your data control',
                      icon: Iconsax.security),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    text: 'App Setting',
                    textColor: TColors.black,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  const TSettingMenutile(
                      title: 'Load Data',
                      subtile: 'Upload your data',
                      icon: Iconsax.copy),

                  TSettingMenutile(
                    title: 'Geolocation',
                    subtile: 'Set recomendation for future',
                    icon: Iconsax.location,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  TSettingMenutile(
                    title: 'Safe Mode',
                    subtile: 'Security for all ages',
                    icon: Iconsax.security_user,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  TSettingMenutile(
                    title: 'HD Image',
                    subtile: 'Set image to be seen',
                    icon: Iconsax.image,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  ///Logout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () =>Get.to(()=>const LoginScreen()), child: const Text('Log Out')),
                  ),

                  const SizedBox(
                    height: TSizes.spaceBtwSections * 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
