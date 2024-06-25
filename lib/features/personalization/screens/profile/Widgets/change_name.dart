import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/features/personalization/controllers/update_name_controller.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/constants/text_strings.dart';
import 'package:e_mart/utils/validators/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(UpdateNameController());
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Change Name'),
        showBackArrow: true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text('Use real name for easy verification. This name will appear on several pages.', style: Theme.of(context).textTheme.labelMedium,),

            const SizedBox(height:TSizes.spaceBtwSections),

            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
              children: [
                TextFormField(
                  controller: controller.firstName,
                  validator: (value)=>TValidator.validateEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields,),

                TextFormField(
                  controller: controller.lastName,
                  validator: (value)=>TValidator.validateEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                )
              ],
            )),

            const SizedBox(height: TSizes.spaceBtwSections,),

            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=>controller.updateUSerName(), child: const Text('Save'))),
          ],
        ),
        ) ,
    );
  }
}