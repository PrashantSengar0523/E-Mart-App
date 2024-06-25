import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../image/t_circular_image.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    print("Profile Picture URL: ${controller.user.value.profilePicture}"); // Debug print

    return ListTile(
      leading: TCircularImage(
        height: 50,
        width: 50,
        isNetworkImg: true,
        image: controller.user.value.profilePicture,
      ),
      title: Text(controller.user.value.firstName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
      subtitle: Text(controller.user.value.email,style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),),
      trailing: IconButton(onPressed:onPressed,icon: const Icon(Iconsax.edit),color: TColors.white,),
    );
  }
}