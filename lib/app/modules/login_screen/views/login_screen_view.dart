import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:page_turner/app/colors.dart';
import 'package:page_turner/app/modules/home_screen/views/home_screen_view.dart';
import 'package:page_turner/app/modules/welcome_screen/views/welcome_screen_view.dart';
import '../../../Forgetpassword/views/forgetpassword_view.dart';
import '../../../authfirebase.dart';
import '../../../firestore.dart';
import '../../bottomnavigat_screen/views/bottomnavigat_screen_view.dart';
import '../../common widgets/BouncyPageRoute.dart';
import '../../common widgets/common_textfield.dart';
import '../../signup_screen/views/signup_screen_view.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  final FirebaseFirestore _firee = FirebaseFirestore.instance;
  Map<String, dynamic> data = {};
  LoginScreenController loginScreenController =
      Get.put(LoginScreenController());
  final database _fire = database();

  LoginScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF433B67),
        body:
            GetBuilder(builder: (LoginScreenController loginScreenController) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 58,
                ),
                Container(
                  height: 800,
                  width: 700,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          topLeft: Radius.circular(100)),
                      color: Colors.white),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Image.asset(
                        'images/welcome-removebg-preview (1).png',
                        height: 250,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      CommonTextField(
                        hinttext: "Email Address",
                        prefixicon: Icons.email,
                        size: 25,
                        controller: loginScreenController.email,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter  Email";
                          }
                          bool emailvalid =
                              RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                  .hasMatch(value!);
                          if (!emailvalid) {
                            return "Enter Valid Email";
                          }
                        },
                        iconcolor: ThemeColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CommonTextField(
                        controller: loginScreenController.password,
                        obscureText: loginScreenController.passToggle,
                        hinttext: "Password",
                        prefixicon: Icons.lock,
                        size: 25,
                        suffixicon: IconButton(
                          onPressed: () {
                            loginScreenController.passToggle =
                                !loginScreenController.passToggle;
                          },
                          icon: Icon(loginScreenController.passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                          color: ThemeColor,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter  password";
                          }
                        },
                        iconcolor: ThemeColor,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context,
                                BouncyPageRoute(widget: ForgetpasswordView()));
                          },
                          child: const Text(
                            'Forget Password?',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 21,
                                fontFamily: "Poppins",
                                color: ThemeColor),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(280, 60),
                              backgroundColor: const Color(0xFF433B67),
                              disabledBackgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              elevation: 8.0),
                          onPressed: () {
                            // if (loginScreenController.formkey.currentState!.validate()) {
                            //   Get.to(const HomeScreenView());
                            // }
                            service
                                .handleSignInEmail(
                                    loginScreenController.email.text,
                                    loginScreenController.password.text)
                                .then((value) => {
                                      _firee
                                          .collection("User")
                                          .doc(FirebaseAuth
                                              .instance.currentUser?.uid)
                                          .update({
                                        "password":
                                            "${loginScreenController.password.text}"
                                      }).then((value) {
                                        value = data;
                                      }),
                                      Navigator.push(
                                          context,
                                          BouncyPageRoute(
                                              widget:
                                                  BottomnavigatScreenView())),
                                    });
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 25),
                          )),
                      const SizedBox(
                        height: 100,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              BouncyPageRoute(widget: SignupScreenView()));
                        },
                        child: RichText(
                            text: const TextSpan(
                          text: " Already have an account??",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: ThemeColor,
                            fontSize: 18,
                          ),
                          children: [
                            TextSpan(
                              text: ' SignUp',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Poppins",
                                color: ThemeColor,
                                fontSize: 20,
                              ),
                            )
                          ],
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
