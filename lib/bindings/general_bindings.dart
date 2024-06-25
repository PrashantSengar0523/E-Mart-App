import 'package:get/get.dart';

import '../utils/networkManager/network_manager.dart';


class GeneralBindings extends Bindings{  
  @override
  void dependencies() {
   Get.put(NetworkManager());
  }
}