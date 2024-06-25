import 'package:e_mart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/authentication/controllers/signup/signup_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/text_strings.dart';

class TTermsAndCondition extends StatelessWidget {
  const TTermsAndCondition({
    super.key,
  });

  // final SignupController controller;

  @override
  Widget build(BuildContext context) {
    final controller=SignupController.instance;
    return Row(
      children: [
        SizedBox(
            height: 24,
            width: 24,
            child: Obx(()=> Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value=!controller.privacyPolicy.value))),
        const SizedBox(
          width: TSizes.xs,
        ),
        Text.rich(TextSpan(children: [
          const TextSpan(
            text: '${TTexts.isAgreeTo} ',
            style: TextStyle(
              color: TColors.darkGrey,
            ),
          ),
          TextSpan(
              text: '${TTexts.privacyPolicy} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  decoration: TextDecoration.underline,
                  color: TColors.primary,
                  decorationColor: TColors.primary)),
          const TextSpan(
            text: '${TTexts.and} ',
            style: TextStyle(
              color: TColors.darkGrey,
            ),
          ),
          TextSpan(
              text: '${TTexts.termsOfUse} ',
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                  decoration: TextDecoration.underline,
                  color: TColors.primary,
                  decorationColor: TColors.primary)),
        ])),
      ],
    );
  }
}
