import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    required this.image,
    this.width = 56,
    this.height = 56,
    this.padding = const EdgeInsets.all(TSizes.sm),
    this.fit,
    this.isNetworkImg = true,
    this.overlayColor,
    this.backgroundColor,
  });

  final String image;
  final double width, height;
  final EdgeInsets padding;
  final BoxFit? fit;
  final bool isNetworkImg;
  final Color? overlayColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? TColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: isNetworkImg
            ? Image.network(image, fit: fit)
            : Image.asset(image, fit: fit),
      ),
    );
  }
}
