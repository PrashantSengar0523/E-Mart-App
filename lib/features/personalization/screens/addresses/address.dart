import 'package:e_mart/common/widgets/appbar/app_bar.dart';
import 'package:e_mart/features/personalization/screens/addresses/add_new_address.dart';
import 'package:e_mart/features/personalization/screens/addresses/widgets/single_address.dart';
import 'package:e_mart/features/shop/models/address_model.dart';
import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/utils/constants/sizes.dart';
import 'package:e_mart/utils/helpers/cloud_helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/address_controller.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddressController addressController = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddress()),
        child: const Icon(Icons.add, color: TColors.white),
      ),
      appBar: TAppBar(
        title: Text(
          'Address',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: TColors.black),
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                ()=> FutureBuilder<List<AddressModel>>(
                  key: Key(addressController.refreshData.value.toString()),
                  future: addressController.allUserAddresses(),
                  builder: (context, snapshot) {
                    final response = TCloudHelperFunctions.checkMultiRecordsState(
                        snapshot: snapshot);
                    if (response != null) {
                      return response;
                    }
                    final addresses = snapshot.data!;
                
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: addresses.length,
                        itemBuilder: (_, index) => TSingleAddress(
                              address: addresses[index],
                              onTap: () => addressController
                                  .selectedAddress(addresses[index]),
                            ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
