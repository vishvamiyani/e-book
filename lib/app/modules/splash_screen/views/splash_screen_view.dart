import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  SplashScreenController splashController = Get.find<SplashScreenController>();
   SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GetBuilder(
builder:  (SplashScreenController splashController ){
return Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
     Stack(
       children: [
         Center(child: Lottie.asset('images/splash.json',height: 200)),
         Padding(
           padding: const EdgeInsets.only(top:135.0,left: 146),
           child: Text('Page Turner',style: TextStyle(
               fontWeight: FontWeight.w700,
               fontFamily: "Poppins",
              fontSize: 20
           ),),
         )
       ],
     )


  ],
);
}
      )
    );
  }
}
