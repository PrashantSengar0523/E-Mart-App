import 'package:e_mart/features/authentication/controllers/forgotPasswordController/forgot_password_controller.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding:const EdgeInsets.all(TSizes.defaultSpace) ,
        child: Column(
          children: [
           Text(TTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,),

           const SizedBox(height: TSizes.spaceBtwSections,),

           Text(TTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,),

           const SizedBox(height: TSizes.spaceBtwSections*2,),

           Form(
            key: controller.forgotPasswordKey,
             child: TextFormField(
              controller: controller.email,
              validator: TValidator.validateEmail,
              decoration: const InputDecoration(
                labelText: TTexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
             ),
           ),
           const SizedBox(height: TSizes.spaceBtwSections,),
           SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.sendPasswordResetEmail(), child: const Text(TTexts.submit)),)
           ]),
        ),
    );
  }
}