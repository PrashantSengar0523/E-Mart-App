import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/features/authentication/screens/passwordConfiguaration/reset_password_screen.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/networkManager/network_manager.dart';
import 'package:e_mart/utils/popups/full_screen_loader.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{
  ForgotPasswordController get instance => Get.find();

  // Variables
  final email=TextEditingController();
  GlobalKey<FormState> forgotPasswordKey=GlobalKey<FormState>();

  sendPasswordResetEmail() async{
      try{
        TFullScreenLoader.openLoadingDialog('Prcessing your request....', TImages.docerAnimation);
        
        final isConnected=await NetworkManager.instance.isConnected();
        if(!isConnected){TFullScreenLoader.stopLoading();return;}

        if(!forgotPasswordKey.currentState!.validate()){TFullScreenLoader.stopLoading();return;}

        await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

        TFullScreenLoader.stopLoading();

        TLoaders.succcessSnackBar(title: 'Email sent',message: 'Email Link sent to Reset your Password'.tr);

        Get.to(()=>ResetPasswordScreeen(email: email.text.trim()));
      }catch(e){
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      }
  }

  resendPasswordResetEmail(
    String email
  )async{
      try{
        TFullScreenLoader.openLoadingDialog('Prcessing your request....', TImages.docerAnimation);
        
        final isConnected=await NetworkManager.instance.isConnected();
        if(!isConnected){TFullScreenLoader.stopLoading();return;}

        await AuthenticationRepository.instance.sendPasswordResetEmail(email);

        TFullScreenLoader.stopLoading();

        TLoaders.succcessSnackBar(title: 'Email sent',message: 'Email Link sent to Reset your Password'.tr);

      }catch(e){
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      }
  }
}