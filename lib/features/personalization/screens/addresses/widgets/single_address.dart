import 'package:e_mart/common/widgets/customShapes/containers/trounded_container.dart';
import 'package:e_mart/features/personalization/controllers/address_controller.dart';
import 'package:e_mart/features/shop/models/address_model.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.address, required this.onTap, });
  final AddressModel address;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final addressController=AddressController.instance;
    final dark=THelperFunctions.isDarkMode(context);
    return Obx(()
     {
      final selectedAddressId=addressController.selectedAddress.value.id;
      final selectedAddress=selectedAddressId==address.id;
      return InkWell(
        onTap: onTap,
        child: TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          showBorder: true,
          width: double.infinity,
          backgroundColor: selectedAddress
              ? TColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress? Colors.transparent:dark?TColors.darkerGrey:TColors.grey,
          margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress? Iconsax.tick_circle5 : null,
                  color: selectedAddress? dark? TColors.light:TColors.dark.withOpacity(0.5):null,
                ),
              ),
        
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(address.name,style: Theme.of(context).textTheme.labelLarge!.apply(fontWeightDelta: 2),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: TSizes.sm/2,),
                  Text(address.formattedPhone,style: Theme.of(context).textTheme.labelLarge,maxLines: 1,overflow: TextOverflow.ellipsis,),
                  const SizedBox(height: TSizes.sm/2,),
                  Text(address.toString(),style: Theme.of(context).textTheme.labelLarge,maxLines: 2,overflow: TextOverflow.ellipsis,softWrap: true,),
                  const SizedBox(height: TSizes.sm/2,),
                ],
              )
            ],
          ),
        ),
      );
      }
    );
  }
}
