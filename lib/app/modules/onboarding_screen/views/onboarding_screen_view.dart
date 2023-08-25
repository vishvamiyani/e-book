import 'package:flutter/material.dart';
import 'package:flutter_onboarding/flutter_onboarding.dart';
import 'package:get/get.dart';
import '../../login_signup/views/login_signup_view.dart';
import '../controllers/onboarding_screen_controller.dart';

class OnboardingScreenView extends GetView<OnboardingScreenController> {
  OnboardingScreenController onboardingScreenController =
      Get.put(OnboardingScreenController());

  OnboardingScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFffffff),
        body: GetBuilder(
            builder: (OnboardingScreenController onboardingScreenController) {
          return FlutterOnBoarding(
            backgroundColor: Colors.white,
            pages: onboardingScreenController.pages,
            onGetStartedRoute: MaterialPageRoute(
              builder: (context) => LoginSignupView(),
            ),
          );
        }),
      ),
    );
  }
}
