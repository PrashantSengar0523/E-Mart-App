import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/common/widgets/customShapes/containers/trounded_container.dart';
import 'package:e_mart/common/widgets/success_screen/success_screen.dart';
import 'package:e_mart/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:e_mart/features/shop/screens/chackout/widgets/TPaymentMethod.dart';
import 'package:e_mart/features/shop/screens/chackout/widgets/billing_address.dart';
import 'package:e_mart/features/shop/screens/chackout/widgets/billing_price.dart';
import 'package:e_mart/features/shop/screens/chackout/widgets/coupon_code.dart';
import 'package:e_mart/navigation_menu.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('checkout',style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body:const SingleChildScrollView(
        child: Column(
          children: [
            TCartItems(showAddRemoveButton: false,),
        
            Padding(
              padding: EdgeInsets.only(left:TSizes.defaultSpace,right:TSizes.defaultSpace,top: TSizes.defaultSpace/2,bottom: TSizes.defaultSpace/2),
              child: TCouponCode(),
            ),
        
        
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: TRoundedContainer(
                backgroundColor: TColors.light,
                padding: EdgeInsets.all(TSizes.md),
                showBorder: true,
                child: Column(
                  children: [
                    ///Pricing
                    TBillinPrice(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    
                    ///Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                    
                    
                    ///Payment Method
                    TPaymentMethod(),
                    SizedBox(height: TSizes.spaceBtwItems,),
                      
                      
                    ///Billing Address
                    TBillingAddress(),
                    
                   
                  ],
                ),
              ),
            )
        
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SizedBox(child: ElevatedButton(onPressed: ()=>Get.to(()=>SuccessScreeen(image: TImages.successfullRegistration, title: 'Payment Success', subtitle: 'Your item will be shipped soon', onPressed: ()=>Get.offAll(()=>const NavigationMenu()))), child: const Text('Checkout \$268.0'))),
        ),


    );

  }
}

