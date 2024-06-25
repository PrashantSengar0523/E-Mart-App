import 'package:e_mart/common/styles/spacing_style.dart';
import 'package:e_mart/common/widgets/login_signup/form_divider.dart';
import 'package:e_mart/common/widgets/login_signup/social_buttons.dart';
import 'package:e_mart/features/authentication/screens/login/widget/login_form.dart';
import 'package:e_mart/features/authentication/screens/login/widget/login_header.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              // //Logo Titile and Subtitle
              const LoginHeader(),

              // //Form
              const LoginForm(),

              ///Divider
              FormDivider(
                dividerText: TTexts.orSignInWith.capitalize!,
              ),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              // ///Footer
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
