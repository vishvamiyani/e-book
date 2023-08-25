import 'package:get/get.dart';
import 'package:page_turner/app/modules/login_signup/views/login_signup_view.dart';

import '../../login_screen/views/login_screen_view.dart';
import '../../onboarding_screen/views/onboarding_screen_view.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    splash();
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
  void splash() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.to(OnboardingScreenView());
    });
  }
}
