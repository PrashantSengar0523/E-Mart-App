import 'package:e_mart/common/widgets/customShapes/containers/trounded_container.dart';
import 'package:e_mart/common/widgets/text/brand_title_verified_icon.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/enums.dart';

class TBrandCards extends StatelessWidget {
  const TBrandCards({
    super.key,
    required this.showBorder,
    this.onTap,
    this.name,
    this.productCount,
    this.imageUrl,
  });

  final bool showBorder;
  final void Function()? onTap;
  final String? name;
  final int? productCount;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    22.5), // Half of the height and width to make it circular
                child: imageUrl != null
                    ? Image.network(
                        imageUrl!,
                        height: 45,
                        width: 45,
                          fit: BoxFit.contain,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) return child;
                          return SizedBox(
                            height: 45,
                            width: 45,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: progress.expectedTotalBytes != null
                                    ? progress.cumulativeBytesLoaded /
                                        progress.expectedTotalBytes!
                                    : null,
                              ),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            TImages.acerlogo,
                            height: 45,
                            width: 45,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        TImages.acerlogo,
                        height: 45,
                        width: 45,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleVerifiedIcon(
                    title: name ?? '',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '$productCount products',
                    style: Theme.of(context).textTheme.labelMedium!.apply(
                          color: TColors.darkGrey,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
