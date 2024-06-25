import 'package:e_mart/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    required this.text,
    this.buttonTitle = 'View all',
    this.textColor = TColors.white,
    this.showActionButton = false,
    this.onPressed,
    this.padding = const EdgeInsets.only(left: TSizes.defaultSpace),
  });

  final String text, buttonTitle;
  final Color? textColor;
  final bool showActionButton;
  final void Function()? onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.headlineSmall!.apply(color: textColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (showActionButton)
            TextButton(
              onPressed: onPressed,
              child: Text(buttonTitle),
            ),
        ],
      ),
    );
  }
}
