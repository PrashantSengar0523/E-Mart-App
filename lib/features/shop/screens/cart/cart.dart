
import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:e_mart/features/shop/screens/chackout/checkout.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../common/widgets/products/product_price/product_price_text.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key,this.showAddRemoveButton=true});
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Cart'),
        showBackArrow: true,
      ),
      body: ListView.builder(
      shrinkWrap: true,
      itemCount: 1,
      // separatorBuilder: (_,__)=>const SizedBox(), 
      itemBuilder: (_,index)=>Column(
        children: [
          const TCartItem(),
          
          if(showAddRemoveButton)
          const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 100,),
                  TProductQuantityWithAddandRemove(),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: TSizes.defaultSpace),
                child: TProductTextPrice(price: '256'),
              ),
            ],
          )
        ],
      ),
      
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: ()=>Get.to(()=>const CheckoutScreen()), child: const Text('Checkout'' \$256.0')),
      ),
    );
  }
}

