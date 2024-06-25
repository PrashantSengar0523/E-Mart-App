import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/features/shop/screens/productReviews/Widgets/progress_indicator.dart';
import 'package:e_mart/features/shop/screens/productReviews/Widgets/user_review_card.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/ratings/rating_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key, this.rating, this.reviews});
  final String ?rating;
  final String ?reviews;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: const TAppBar(
        title: Text(
          'Reviews & Ratings',
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Ratings and reviews are verified by people who use the same type of device you use.'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      rating??'',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
                  const TProgressIndicator(),
                ],
              ),
              const TRatingBarIndicator(
                rating: 4.0,
              ),
              Text(
                reviews??'',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const UserReviewCard(
                name: 'Jane Smith',
                image: TImages.userProfileImage1,
              ),
              const UserReviewCard(
                name: 'Alex Cruise',
                image: TImages.userProfileImage2,
              ),
              const UserReviewCard(
                name: 'Mark Aane',
                image: TImages.userProfileImage3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
