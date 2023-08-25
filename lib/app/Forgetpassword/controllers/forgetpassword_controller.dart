import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetpasswordController extends GetxController {
  //TODO: Implement VerificationController

 TextEditingController email = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {

    super.onInit();
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
