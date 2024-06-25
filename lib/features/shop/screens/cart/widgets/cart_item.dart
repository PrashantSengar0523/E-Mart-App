import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/product_price/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, this.showAddRemoveButton=true,
  });
  final bool showAddRemoveButton;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
      
      );
  }
}


