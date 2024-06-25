import 'package:e_mart/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:e_mart/features/authentication/screens/onboarding/widgets/onbaording_skip.dart';
import 'package:e_mart/features/authentication/screens/onboarding/widgets/onboarding_button.dart';
import 'package:e_mart/features/authentication/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:e_mart/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_mart/utils/constants/image_strings.dart';

import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          //Horizontal PageView
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(image: TImages.onBoardingImage1, title: TTexts.onBoardingTitle1, subtitle: TTexts.onBoardingSubTitle1),
              OnBoardingPage(image: TImages.onBoardingImage2, title: TTexts.onBoardingTitle2, subtitle: TTexts.onBoardingSubTitle2),
              OnBoardingPage(image: TImages.onBoardingImage3, title: TTexts.onBoardingTitle3, subtitle: TTexts.onBoardingSubTitle3),
            ],
          ),
      
          //Skip Button
          const OnboardingSkip(),


          //Dot Navigation SmoothPageIndicator
          const DotNavigation(),


          //Circular Button
          const OnboardingButton()

     ],
      ),
    );
  }


  
}







