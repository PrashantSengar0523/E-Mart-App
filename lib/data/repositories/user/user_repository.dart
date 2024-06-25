



import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unnecessary_import
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_mart/data/repositories/authentication/authentication_repository.dart';
import 'package:e_mart/data/repositories/user/user_model.dart';
import 'package:e_mart/utils/Exceptions/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/Exceptions/firebase_exception.dart';
import '../../../utils/Exceptions/format_exception.dart';
import '../../../utils/Exceptions/platform_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Function to save user data to Firestroe
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
      
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
  
  //Function to fetch user Details
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot=await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }
      
    }on FirebaseAuthException catch (e) {
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

  //Function to update User Record
  Future<void> updateUserRecord(UserModel updateUser) async {
  try {
    await _db.collection('Users').doc(updateUser.id).update(updateUser.toJson());
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw TFormatException;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong';
  }
  }
//Function to Update Signle User field Record
Future<void> updateSingleField( Map<String, dynamic> json) async {
  try {
    await _db.collection('Users').doc(AuthenticationRepository.instance.authUser?.uid).update(json);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw TFormatException;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong';
  }
}

//Function to Remove User Record
Future<void> removeUserRecord( String userId) async {
  try {
    await _db.collection('Users').doc(userId).delete();
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw TFormatException;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong';
  }
}

       ///[UploadImage] -Uploading User Image


Future<String> uploadImage(String path, XFile image) async {
  try {
    final ref = FirebaseStorage.instance.ref(path).child(image.name);

    // Convert XFile to Uint8List for web compatibility
    Uint8List imageData = await image.readAsBytes();

    // Upload the file to the specified location
    await ref.putData(imageData);

    // Get and return the download URL of the uploaded file
    final url = await ref.getDownloadURL();
    return url;
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    throw TFormatException;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong';
  }
}


}
