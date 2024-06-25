import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/features/shop/screens/order/widgets/order_list.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Orders',),
        showBackArrow: true,
      ),
      body: Padding(
        padding:EdgeInsets.all(TSizes.defaultSpace),
        child: TOrderList(), 
      ),
    );
  }
}