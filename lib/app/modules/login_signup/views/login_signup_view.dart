import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:page_turner/app/colors.dart';
import 'package:page_turner/app/modules/common%20widgets/BouncyPageRoute.dart';
import 'package:page_turner/app/modules/login_screen/views/login_screen_view.dart';

import '../../signup_screen/views/signup_screen_view.dart';
import '../controllers/login_signup_controller.dart';

class LoginSignupView extends GetView<LoginSignupController> {
  LoginSignupController loginSignupController =
      Get.put(LoginSignupController());

  LoginSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        GetBuilder(builder: (LoginSignupController loginSignupController) {
      return Center(
        child: Column(
          children: [
            SizedBox(
              height: 230,
            ),
            Image.asset(
              'images/welcome-removebg-preview (1).png',
              height: 150,
            ),
            SizedBox(
              height: 26,
            ),
            Text(
              'Say Hello To Your New App!',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ThemeColor,
                  fontSize: 18,
                  fontFamily: "Poppins"),
            ),
            const SizedBox(
              height: 26,
            ),
            const Text(
              "You've just Saved a week of development\n"
              "                     and headaches. ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(230, 60),
                    backgroundColor: const Color(0xFF433B67),
                    disabledBackgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    elevation: 8.0),
                onPressed: () {
                  Navigator.push(
                      context, BouncyPageRoute(widget: LoginScreenView()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                )),
            const SizedBox(
              height: 25,
            ),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  fixedSize: const Size(230, 60),
                  side: const BorderSide(
                    color: Color(0xFF433B67),
                    width: 3,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  // Get.to(SignupScreenView(),transition: Transition.circularReveal);

                  Navigator.push(
                      context, BouncyPageRoute(widget: SignupScreenView()));
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      color: Color(0xFF433B67),
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                )),
          ],
        ),
      );
    }));
  }
}
