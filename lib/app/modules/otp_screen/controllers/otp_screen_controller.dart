import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController {
  //TODO: Implement OtpScreenController
  TextEditingController  otp= TextEditingController();
  String _verificationCode="";

  String get verificationCode => _verificationCode;

  set verificationCode(String value) {
    _verificationCode = value;
    update();
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
