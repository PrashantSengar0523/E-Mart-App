import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key, this.iconColor=TColors.black, required this.onPressed,
  });
  final Color iconColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon:  Icon(Iconsax.shopping_bag,color: iconColor,)),
        Positioned(
          right: 0,
          child: Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              color: TColors.black,
              borderRadius:
                  BorderRadius.circular(100),
            ),
            child: Center(
              child: Text("2",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(
                          color: TColors.white,
                          fontSizeFactor: 0.8)),
            ),
          ),
        )
      ],
    );
  }
}
