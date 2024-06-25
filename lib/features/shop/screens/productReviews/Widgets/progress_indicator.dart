import 'package:e_mart/features/shop/screens/productReviews/Widgets/rating_progress_indicator.dart';
import 'package:flutter/material.dart';

class TProgressIndicator extends StatelessWidget {
  const TProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 7,
      child: Column(
        children: [
          TRatingProgressIndicator(
            text: '5',
            value: 1,
          ),
          TRatingProgressIndicator(
            text: '4',
            value: 0.8,
          ),
          TRatingProgressIndicator(
            text: '3',
            value: 0.6,
          ),
          TRatingProgressIndicator(
            text: '2',
            value: 0.4,
          ),
          TRatingProgressIndicator(
            text: '1',
            value: 0.2,
          ),
        ],
      ),
    );
  }
}
