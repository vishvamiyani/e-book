import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../firestore.dart';

class SignupScreenController extends GetxController {
  //TODO: Implement SignupScreenController
  final formkey = GlobalKey<FormState>();
  TextEditingController  email= TextEditingController();
  TextEditingController  password= TextEditingController();
  TextEditingController  username= TextEditingController();
  final count = 0.obs;
  bool _passToggle= true;

  bool get passToggle => _passToggle;

  set passToggle(bool value) {
    _passToggle = value;
    update();
  } //

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
