import 'package:e_mart/common/widgets/text/t_brand_text_title.dart';
import 'package:e_mart/utils/constants/enums.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


import '../../../utils/constants/sizes.dart';

class TBrandTitleVerifiedIcon extends StatelessWidget {
  const TBrandTitleVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = Colors.lightBlue,
    this.brandTextSize = TextSizes.small,
    this.textAlign = TextAlign.center,
  });
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextSizes brandTextSize;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: TBrandTitleText(
            title: title,
            maxLines: maxLines,
            color: textColor,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: TSizes.iconXs,
        )
      ],
    );
  }
}

