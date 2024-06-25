import 'package:e_mart/utils/constants/colors.dart';
import 'package:e_mart/common/widgets/loaders/loader_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {

  static void openLoadingDialog(String text, String animation) {
    Get.dialog(
      PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: TColors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              children: [
                TAnimationLoader(animation: animation, text: text),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  /// Stop the currently open Loading Dialog
  /// This method doesn't return anything
  static void stopLoading() {
    if (Get.isDialogOpen ?? false) {
      Get.back(); // Close the Dialog using Get.back()
    }
  }
}
