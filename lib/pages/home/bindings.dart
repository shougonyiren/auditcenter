import 'package:get/get.dart';

import 'logic.dart';



class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeLogic>(() => HomeLogic());
  }
}
