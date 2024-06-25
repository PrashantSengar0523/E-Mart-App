import 'package:e_mart/features/authentication/controllers/login/login_contorller.dart';
import 'package:e_mart/features/authentication/screens/passwordConfiguaration/fortgot_password_screen.dart';
import 'package:e_mart/features/authentication/screens/signup/signup.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(LoginContorller());
    return Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
                          children: [
          //Email
          TextFormField(
            controller: controller.email,
            validator: (value)=>TValidator.validateEmail(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.email),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields,
          ),
          
          //Password
          Obx(
            ()=> TextFormField(
              controller: controller.password,
              validator: (value)=>TValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value,
                    icon:Icon( controller.hidePassword.value? Iconsax.eye_slash:Iconsax.eye))),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwInputFields / 2,
          ),
          
          //Remember me & Forgot Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Remember me
              Row(
                children: [
                  Obx(()=> Checkbox(value: controller.rememberMe.value, onChanged: (value)=>controller.rememberMe.value=!controller.rememberMe.value)),
                  const Text(TTexts.rememberMe),
                ],
              ),
              /// Forgot Password
              TextButton(onPressed: ()=>Get.to(()=>const ForgotPasswordScreen()),child: const Text(TTexts.forgetPassword),),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwSections,),
          
          /// Sign In
          SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.emailPasswordSignIn(), child: const Text(TTexts.signIn))),
          const SizedBox(height: TSizes.spaceBtwItems,),
          
          
          SizedBox(width: double.infinity, child: OutlinedButton(onPressed: ()=>Get.to((()=>const SignUp())), child: const Text(TTexts.createAccount)),),
                          ],
                        ),
        ));
  }
}
