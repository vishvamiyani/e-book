import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../colors.dart';
import '../controllers/bottomnavigat_screen_controller.dart';

class BottomnavigatScreenView extends GetView<BottomnavigatScreenController> {
  BottomnavigatScreenController bottomnavigatScreenController = Get.put(BottomnavigatScreenController());
   BottomnavigatScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GetBuilder(builder: (BottomnavigatScreenController bottomnavigatScreenController) {
        return bottomnavigatScreenController.screens[bottomnavigatScreenController.index];
      }),

      bottomNavigationBar: CurvedNavigationBar(
      height: 70,
      color: ThemeColor,
      backgroundColor: Colors.transparent,
      items: bottomnavigatScreenController.items,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 300),
      index: bottomnavigatScreenController.index,
      onTap: (index) => this.bottomnavigatScreenController .index = index,

    ),
    );
  }

}
