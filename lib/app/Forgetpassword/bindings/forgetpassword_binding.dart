import 'package:get/get.dart';

import '../controllers/forgetpassword_controller.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetpasswordController>(
      () => ForgetpasswordController(),
    );
  }
}
