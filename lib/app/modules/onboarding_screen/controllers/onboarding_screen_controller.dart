import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding/onboarding_model.dart';
import 'package:get/get.dart';


class OnboardingScreenController extends GetxController {
  //TODO: Implement OnboardingScreenController
  final pages = [
    IntroModel(
      title: 'Explore,learn and Save',
      description:
      'Read across categories and save \nyour favorites to your Library',
      titleColor: Colors.black,
      descriptionColor: Colors.black,
      imagePath: 'images/onboarding1.png',
    ),
    IntroModel(
      title: 'Stay Updated',
      description:
      'Get latest updates on books \nAuthors and favorite categories',
      titleColor: Colors.black,

      descriptionColor: Colors.black,
      imagePath: 'images/onboarding2.jpg',
    ),
    IntroModel(
      title: 'Become a Maestro',
      description:
      'Become a maestro to upload \nyour publicatons',
      titleColor: Colors.black,
      descriptionColor: Colors.black,
      imagePath: 'images/onboarding3.jpg',
    ),
  ];

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


}
