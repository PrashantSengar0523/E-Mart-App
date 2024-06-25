import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  TAppBar(
        title: Text('Popular Products'),
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding:EdgeInsets.all(TSizes.defaultSpace),
          child: TSortableProducts(),
          ),
      ),

    );
  }
}

