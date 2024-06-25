// ignore_for_file: unused_local_variable

import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/networkManager/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginContorller extends GetxController{
  // static LoginContorller get instance=>Get.find();

  //Variables
  final rememberMe=false.obs;
  final hidePassword=true.obs;
  final localStorage=GetStorage();
  final email=TextEditingController();
  final password=TextEditingController();
  GlobalKey<FormState>loginFormKey=GlobalKey<FormState>();
  final userController=Get.put(UserController());
  Future<void> emailPasswordSignIn()async{
    try {
  ///Start Loading
      TFullScreenLoader.openLoadingDialog(
          'Logging in you.......', TImages.docerAnimation);

      ///check Internet Connectivity
      // ignore: await_only_futures
      final isConnected = await NetworkManager.instance.isConnected();
      // ignore: unrelated_type_equality_checks
      if (isConnected == false) return;


  //Form Validation
      if (loginFormKey.currentState != null && !loginFormKey.currentState!.validate()) {
    TFullScreenLoader.stopLoading();
    return;
      }

  //Save Data if Remember Me is Selected
      if(rememberMe.value){
        localStorage.write('Remember_Me_Email', email.text.trim());
        localStorage.write('Remember_Me_Password', password.text.trim());
      }

  //Login User using Email & password
      final userCredential=await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

  //Stop Loading
  TFullScreenLoader.stopLoading();

  //Redirect
  AuthenticationRepository.instance.screenRedirect();

  } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } 
}

Future<void> gooleSignIn()async{
  try{
    //Show Loading
    TFullScreenLoader.openLoadingDialog('Logging you in', TImages.docerAnimation);

    final isConnected = await NetworkManager.instance.isConnected();
      // ignore: unrelated_type_equality_checks
      if (isConnected == false) return;
    
    //Authentication
    final userCredential=await AuthenticationRepository.instance.signInWithGoogle();

    //Save User Credentials
    await userController.saveUserRecord(userCredential);

    //Remove Loader
    TFullScreenLoader.stopLoading();

    //Redirect
    AuthenticationRepository.instance.screenRedirect();

  }catch (e){
    TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());
  }
}

}