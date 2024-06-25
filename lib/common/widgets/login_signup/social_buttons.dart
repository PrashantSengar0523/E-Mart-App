import 'package:e_mart/features/authentication/controllers/login/login_contorller.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
final controller = Get.put(LoginContorller());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 40,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: TColors.grey),borderRadius: BorderRadius.circular(100)),
            child: IconButton(onPressed: (){}, icon: const Image(image: AssetImage(TImages.facebook))),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),
        SizedBox(
          width: 40,
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: TColors.grey),borderRadius: BorderRadius.circular(100)),
            child: IconButton(onPressed:()=> controller.gooleSignIn(), icon: const Image(image: AssetImage(TImages.google))),
          ),
        ),
      ],
    );
  }
}