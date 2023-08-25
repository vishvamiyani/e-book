import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_turner/app/colors.dart';


import '../../../authfirebase.dart';
import '../../common widgets/common_textfield.dart';
import '../controllers/verify_screen_controller.dart';

class VerifyScreenView extends GetView<VerifyScreenController> {
  Auth service = Auth();
  VerifyScreenController verifyScreenController =
      Get.put(VerifyScreenController());

  VerifyScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: SingleChildScrollView(
        child: GetBuilder(
            builder: (VerifyScreenController verifyScreenController) {
          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 65,
              ),
              Center(
                child: SizedBox(
                  height: 280,
                  width: 280,
                  child: Lottie.asset(
                    'images/forgetpass.json',
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 80.0, bottom: 5.0),
                child: Text(
                  'Enter Mobile Number ',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 15,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              CommonTextField(

                hinttext: "Email Address",
                prefixicon: Icons.email,
                size: 25,
                controller: verifyScreenController.email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter  Email";
                  }
                  bool emailvalid = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                      .hasMatch(value!);
                  if (!emailvalid) {
                    return "Enter Valid Email";
                  }
                }, iconcolor: ThemeColor,
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(260, 60),
                      backgroundColor: ThemeColor,
                      disabledBackgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 8.0),
                  onPressed: () {

                  },
                  child: const Text('Send',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                      fontSize: 25
                  ),)),
            ],
          );
        }),
      )),
    );
  }
}
