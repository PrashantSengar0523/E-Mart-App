import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_mart/features/shop/models/category_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/Exceptions/firebase_auth.dart';
import '../../../utils/Exceptions/firebase_exception.dart';
import '../../../utils/Exceptions/format_exception.dart';
import '../../../utils/Exceptions/platform_exception.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  ///Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
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

  ///upload categories to the cloud Firebase
// Future<void> uploadDummyData(List<CategoryModel> categories) async {
//   try {
//     final storage = Get.put(FirebaseStorageService());

//     for (var category in categories) {
//       final file = await storage.getImageDataFromAssets(category.image);

//       final url = await storage.uploadImageData('categories', file, category.name); // await added here

//       category.image = url;

//       await _db
//           .collection("categories")
//           .doc(category.id)
//           .set(category.toJson());
//     }
//   } on FirebaseAuthException catch (e) {
//     throw TFirebaseAuthException(e.code).message;
//   } on FirebaseException catch (e) {
//     throw TFirebaseException(e.code).message;
//   } on FormatException catch (_) {
//     throw TFormatException;
//   } on PlatformException catch (e) {
//     throw TPlatformException(e.code).message;
//   } catch (e) {
//     throw 'Something went wrong';
//   }
// }
}
