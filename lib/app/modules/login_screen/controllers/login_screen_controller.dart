import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  //TODO: Implement LoginScreenController
  final formkey = GlobalKey<FormState>();
  TextEditingController  email= TextEditingController();
  TextEditingController  password= TextEditingController();
  bool _passToggle= true;

  bool get passToggle => _passToggle;

  set passToggle(bool value) {
    _passToggle = value;
    update();
  } //
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
