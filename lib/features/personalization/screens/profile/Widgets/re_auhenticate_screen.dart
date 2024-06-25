import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReAuhenticateLoginScreen extends StatelessWidget {
  const ReAuhenticateLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(UserController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Re-Authenticate User'),
        showBackArrow: true,
      ),
      body: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          Form(
            key: controller.reAuthFormKey,
            child: Column(
            children: [
              TextFormField(
                controller: controller.verifyEmail,
                validator: (value)=>TValidator.validateEmail(value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields,),
              Obx(
                ()=> TextFormField(
                  obscureText: controller.hidePassword.value,
                  controller: controller.verifyPassword,
                  validator: (value)=>TValidator.validatePassword(value),
                  expands: false,
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    prefixIcon: const Icon(Iconsax.direct_right),
                    suffixIcon: IconButton(
                      onPressed: ()=>controller.hidePassword.value=!controller.hidePassword.value,
                      icon:Icon( controller.hidePassword.value? Iconsax.eye_slash:Iconsax.eye))),
                
                  ),
              ),
            ],
          )),

          const SizedBox(height: TSizes.spaceBtwItems,),

           SizedBox(width: double.infinity,child: ElevatedButton(onPressed: ()=>controller.reAuthenticateEmailAndPassword(), child: const Text('Verify')),)
        ],
      ),
      ),
    );
  }
}