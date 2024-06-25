import 'package:e_mart/common/widgets/login_signup/form_divider.dart';
import 'package:e_mart/common/widgets/login_signup/social_buttons.dart';
import 'package:e_mart/features/authentication/screens/signup/widgets/signup_form.dart';

import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              
              ///Header
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              const SignUpForm(),


              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),


              FormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              
              const SocialButtons(),

            ],
          ),
        ),
      ),
    );
  }
}


///Header
              // Text(
              //   TTexts.signupTitle,
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
              // const SizedBox(
              //   height: TSizes.spaceBtwItems,
              // ),

              // ///SignUp Form
              // const SignUpForm(),

              // const SizedBox(
              //   height: TSizes.spaceBtwSections,
              // ),

              // ///Divider
              // FormDivider(dividerText: TTexts.orSignInWith.capitalize!),

              // const SizedBox(
              //   height: TSizes.spaceBtwSections,
              // ),
              
              // ///Social Button
              // const SocialButtons(),