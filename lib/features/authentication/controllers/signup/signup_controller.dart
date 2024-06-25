

import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/data/repositories/user/user_repository.dart';
import 'package:e_mart/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:e_mart/utils/constants/image_strings.dart';
import 'package:e_mart/utils/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../data/repositories/user/user_model.dart';
import '../../../../utils/networkManager/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidePassword=true.obs;
  final privacyPolicy=true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final userName = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
  ///Start Loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.docerAnimation);

      ///check Internet Connectivity
      // ignore: await_only_futures
      final isConnected = await NetworkManager.instance.isConnected();
      // ignore: unrelated_type_equality_checks
      if (isConnected == false) return;


  //Form Validation
      if (!signupFormKey.currentState!.validate()) return;

  //Privacy Policy
      if(!privacyPolicy.value){
        TLoaders.warningSnackBar(title: 'Accept Privacy Policy',message:'In order to create account, you must have to read and accept the Privacy Policy & Terms of use' );
        return;
      }


  //Register the user in Firebase Authentication & save user data
      final userCredential=await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

  //Save Authenticated user data in Firestore
      final newUser = UserModel(id: userCredential!.user!.uid, email: email.text.trim(), userName: userName.text.trim(), firstName: firstName.text.trim(), lastName: lastName.text.trim(), phone: phone.text.trim(), profilePicture: '');

      final userRepository=Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);
  //Stop Loading
      TFullScreenLoader.stopLoading();

  //Show Success Message
      TLoaders.succcessSnackBar(title: 'Congratulation',message: 'Your account has been created. Verify your email');

  //Move to Verify Email Screen
      Get.to(()=>VerifyEmailScreen(email: email.text.trim()));


    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } 
  }
}


 
