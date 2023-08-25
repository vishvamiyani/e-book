import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  WelcomeScreenController welcomeScreenController = Get.put(WelcomeScreenController());
   WelcomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WelcomeScreenView'),
        centerTitle: true,
      ),
      body: GetBuilder(
        builder: (WelcomeScreenController welcomeScreenController) {
          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Lottie.asset('images/VID_247850317_221452_744.mp4.lottie.json',height: 100),
          );
        }
      ),
    );
  }
}
