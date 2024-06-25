import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.height = 56,
    this.width = 56,
    this.padding = const EdgeInsets.all(TSizes.sm),
    this.fit = BoxFit.none,
    required this.image,
    this.isNetworkImg = true,
    this.overlayColor,
    this.backgroundColor,
  });

  final double height, width;
  final EdgeInsets padding;
  final BoxFit? fit;
  final String image;
  final bool isNetworkImg;
  final Color? overlayColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    print("Loading image: $image"); // Debug print

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipOval(
        child: isNetworkImg
            ? CachedNetworkImage(
                imageUrl: image,
                fit: fit,
                color: overlayColor,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) {
                  print("Failed to load image: $url"); // Debug print
                  return const Icon(Icons.error);
                },
              )
            : Image(
                image: AssetImage(image),
                fit: fit,
                color: overlayColor,
              ),
      ),
    );
  }
}
