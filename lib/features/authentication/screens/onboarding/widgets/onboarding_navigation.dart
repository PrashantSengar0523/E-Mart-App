import 'package:e_mart/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DotNavigation extends StatelessWidget {
  // final isLight=THelperFunctions().isDarkMode(context);

 const DotNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: OnBoardingController.instance.pageController,
        onDotClicked: OnBoardingController.instance.dotNavigatorClick,
        count: 3,
        effect: const ExpandingDotsEffect(
          activeDotColor:  TColors.black ,
        ),
      ),
    );
  }
}