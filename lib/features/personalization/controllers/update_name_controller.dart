import 'package:e_mart/data/repositories/user/user_repository.dart';
import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:e_mart/features/personalization/screens/profile/profile_screen.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/networkManager/network_manager.dart';
import 'package:e_mart/utils/popups/full_screen_loader.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController{
  static UpdateNameController get instance=>Get.find();

  final firstName=TextEditingController();
  final lastName=TextEditingController();
  final userController=Get.put(UserController());
  final userRepository=UserRepository.instance;
  GlobalKey<FormState> updateUserNameFormKey=GlobalKey<FormState>();

  
  @override
  void onInit(){
    initializeName();
    super.onInit();

  }
  
  Future<void> initializeName()async {
    firstName.text=userController.user.value.firstName;
    lastName.text=userController.user.value.lastName;
  }

  Future<void> updateUSerName()async{
    try{
      //show loading
      TFullScreenLoader.openLoadingDialog('We are updating your information', TImages.docerAnimation);

      //Check internet connectivity
      final isConnected=await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Form validation
      if(!updateUserNameFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }

      //Storing in Firestore
      Map<String,dynamic> name={'firstName':firstName.text.trim(),'lastName':lastName.text.trim()};
      await userRepository.updateSingleField(name);
      
      //Updating Rx value which will show on screen
      userController.user.value.firstName=firstName.text.trim();
      userController.user.value.firstName=firstName.text.trim();

      //stop loading
      TFullScreenLoader.stopLoading();

      //success message
      TLoaders.succcessSnackBar(title: 'Congratulation', message: 'Your name has been updated');

      Get.off(()=>const ProfileScreen());
    }catch (e){
       TFullScreenLoader.stopLoading();
       TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
    }
  }
}