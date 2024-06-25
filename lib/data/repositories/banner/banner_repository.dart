import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/banner_model.dart';
import '../../../utils/Exceptions/firebase_auth.dart';
import '../../../utils/Exceptions/firebase_exception.dart';
import '../../../utils/Exceptions/format_exception.dart';
import '../../../utils/Exceptions/platform_exception.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

Future<List<BannerModel>> fetchBanners() async {
  try {
    print('Fetching banners from Firestore...');
    final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();
    print('Fetched ${result.docs.length} banners');

    final banners = result.docs.map((documentSnapshot) {
      final banner = BannerModel.fromSnapshot(documentSnapshot);
      print('Fetched banner with imageUrl: ${banner.imageUrl}'); // Log image URL
      return banner;
    }).toList();

    return banners;
  } on FirebaseAuthException catch (e) {
    print('FirebaseAuthException: ${e.code}');
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    print('FirebaseException: ${e.code}');
    throw TFirebaseException(e.code).message;
  } on FormatException catch (_) {
    print('FormatException');
    throw TFormatException;
  } on PlatformException catch (e) {
    print('PlatformException: ${e.code}');
    throw TPlatformException(e.code).message;
  } catch (e) {
    print('General exception: $e');
    throw 'Something went wrong';
  }
}
}
