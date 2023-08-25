import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../firestore.dart';

class ProfileScreenController extends GetxController {
  //TODO: Implement ProfileScreenController
  ImagePicker picker = ImagePicker();
  XFile? pickedimage;
  late String imagepath;
  final count = 0.obs;
  //var name ="";

  @override
  void onInit() {
  //  getsave();
    onpress();
    super.onInit();
  }
  // getsave() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   name = prefs.getString('username')!;
  //   update();
  // }
  Future<void Function()?> onpress() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedimage = XFile(pickedFile.path);
      imagepath = pickedFile.path;
      update();
    }
    SharedPreferences data =
    await SharedPreferences.getInstance();
    await data.setString(
        "Image", pickedimage!.path.toString());
    return null;
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
