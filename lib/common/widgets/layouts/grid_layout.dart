import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class TGridLayout extends StatelessWidget {
  const TGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent=288,
    required this.itemBuilder,
  });
  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;
  @override
  Widget build(BuildContext context) {
    //Function for Responsive screenSize
    int getCrossAxisCount(double screenWidth) {
      // Calculate the cross-axis count based on the screen width
      double itemWidth = 180; // Adjust this value based on your item width
      double viewportFraction = itemWidth / screenWidth;

      // Calculate the number of items to show on the screen
      int crossAxisCount = (1 / viewportFraction).floor();
      return crossAxisCount;
    }

    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: TSizes.gridViewSpacing,
        crossAxisSpacing: TSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder:itemBuilder,
    );
  }
}
