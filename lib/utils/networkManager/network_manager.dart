import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  // ignore: unused_field
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;


  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      // ignore: unrelated_type_equality_checks
      return result != ConnectivityResult.none;
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('PlatformException during connectivity check: $e');
      return false;
    } catch (e) {
      // ignore: avoid_print
      print('Unexpected error during connectivity check: $e');
      return false;
    }
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
