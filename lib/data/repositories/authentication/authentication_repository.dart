

import 'package:e_mart/data/repositories/user/user_repository.dart';
import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:e_mart/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_mart/features/authentication/screens/signup/verify_email_screen.dart';
import 'package:e_mart/navigation_menu.dart';
import 'package:e_mart/utils/Exceptions/format_exception.dart';
import 'package:e_mart/utils/Exceptions/platform_exception.dart';
import 'package:e_mart/utils/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../utils/Exceptions/firebase_auth.dart';
import '../../../utils/Exceptions/firebase_exception.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser=>_auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  Future<void> screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        await TLocalStorage.init(user.uid);
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBoardingScreen());
    }
  }
/* --------------------------Email  & Password Sign In -----------------------------*/

    ///[EmailAuthentication] - User Login
    Future<UserCredential?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong';
    }
  }

  ///[EmailAuthentication] - Register User
  Future<UserCredential?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong';
    }
  }
  
  ///[EmailAuthentication] - E-mail Verification
  Future<void> sendEmialVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong';
    }
  }

  ///[EmailAuthentication] - Register User
  Future<void> sendPasswordResetEmail(
      String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong';
    }
  }
  ///[ReAuthenticate] Re-Authenticate-User
  Future<void> reAuthenticateEmailAndPassword(String email,String password) async{
    try {
      AuthCredential credential=EmailAuthProvider.credential(email: email, password: password);
      
      await _auth.currentUser!.reauthenticateWithCredential(credential);

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong';
    }
  }


/* --------------------------Federated Identity & Social Sign In -----------------------------*/

  ///[GoogleAuthentication] - Google
Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger Google Sign-In authentication
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // If the user cancels the sign-in process
      if (userAccount == null) {
        return null;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await userAccount.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in the user with the credential
      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }
  ///[EmailAuthentication] - User Logout
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong';
    }
  }

   ///[DeleteAccounr] -Delete User Account
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);

      await _auth.currentUser?.delete();
      
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    }catch (e){
      throw 'Something went wrong';
    }
  }


  
}
