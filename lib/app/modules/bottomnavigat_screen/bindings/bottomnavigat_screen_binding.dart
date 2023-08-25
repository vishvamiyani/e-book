import 'package:get/get.dart';

import '../controllers/bottomnavigat_screen_controller.dart';

class BottomnavigatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomnavigatScreenController>(
      () => BottomnavigatScreenController(),
    );
  }
}
