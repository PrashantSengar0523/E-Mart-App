import 'package:e_mart/common/widgets/shimmer/shimmer.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key,this.itemCount=6});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_,__)=>const SizedBox(width: TSizes.spaceBtwItems,), itemCount: itemCount,
        itemBuilder: (_,__){
          return const Column(
            children: [
              //Image
              TShimmer(width: 55, height: 55,radius: 55,),
              SizedBox(width: TSizes.spaceBtwItems/2,),

              //Text
              TShimmer(width: 55, height: 8),
            ],
          );
        } 
        ),
    );
  }
}