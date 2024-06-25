

import 'package:e_mart/features/authentication/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class OnBoardingController extends GetxController{

  static OnBoardingController get instance => Get.find();
  final pageController=PageController();
  RxInt currentPageIndex=0.obs;


  void updatePageIndicator(index)=>currentPageIndex.value=index;


  void dotNavigatorClick(index){
    currentPageIndex.value=index;
    pageController.jumpTo(index);
  }

  
void nextPage() {
  if (currentPageIndex.value == 2) {
    final storage=GetStorage();

  
    storage.write('isFirstTime', false);

   
      
    Get.offAll(const LoginScreen());
  } else {
    int nextPage = currentPageIndex.value + 1;
    pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 400),
      curve: Curves.ease,
    );
  }
}



  void skipPage(){
    currentPageIndex.value=2;
    pageController.jumpToPage(2);
  }

}