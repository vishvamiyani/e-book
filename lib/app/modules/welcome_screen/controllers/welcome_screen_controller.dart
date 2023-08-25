

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:page_turner/app/modules/common%20widgets/BouncyPageRoute.dart';

import '../../home_screen/views/home_screen_view.dart';

class WelcomeScreenController extends GetxController {
  //TODO: Implement WelcomeScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    welcome();
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
  void welcome() {
    Future.delayed(const Duration(seconds: 4), () {
    // Get.put( HomeScreenView());
    });
  }
}
