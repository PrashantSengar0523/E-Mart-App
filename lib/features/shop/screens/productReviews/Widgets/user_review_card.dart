import 'package:e_mart/common/widgets/customShapes/containers/trounded_container.dart';
import 'package:e_mart/common/widgets/ratings/rating_indicator.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.name, required this.image});
  final String name;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(image),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleSmall,
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        Row(
          children: [
            const TRatingBarIndicator(rating: 4.0),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '11 Nov,2024',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        const ReadMoreText(
          'The user interface of the app is quite intutive. I was able to navigate and purchases seamlessly. Great Job ',
          trimLines: 1,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: TColors.primary),
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        //Company Review
        TRoundedContainer(
          backgroundColor: TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "E's Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "14 Nov, 2024",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const ReadMoreText(
                  'The user interface of the app is quite intutive. I was able to navigate and purchases seamlessly. Great Job ',
                  trimLines: 1,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems,),
      ],
    );
  }
}
