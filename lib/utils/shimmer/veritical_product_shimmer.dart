import 'package:e_mart/common/widgets/layouts/grid_layout.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TVerticalProductShimmer extends StatelessWidget {
  final int itemCount;

  const TVerticalProductShimmer({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
