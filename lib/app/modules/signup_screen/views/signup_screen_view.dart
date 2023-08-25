

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_turner/app/modules/common%20widgets/BouncyPageRoute.dart';
import 'package:page_turner/app/modules/home_screen/views/home_screen_view.dart';
import 'package:page_turner/app/modules/login_screen/views/login_screen_view.dart';
import 'package:page_turner/app/modules/welcome_screen/views/welcome_screen_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../authfirebase.dart';
import '../../../colors.dart';
import '../../../firestore.dart';
import '../../bottomnavigat_screen/views/bottomnavigat_screen_view.dart';
import '../../common widgets/common_textfield.dart';

import '../controllers/signup_screen_controller.dart';

class SignupScreenView extends GetView<SignupScreenController> {
  SignupScreenController signupScreenController =Get.put(SignupScreenController());
  final database _fire = database();
   SignupScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF433B67),
          body:SingleChildScrollView(
            child: GetBuilder(builder: (SignupScreenController signupScreenController){
              return
                Column(
                  children: [
                     const SizedBox(height: 58,),
                      Container(
                        height: 800,
                        width: 700,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(100),topLeft: Radius.circular(100)),
                            color: Colors.white
                          ),
                        child: Column(
                          children:  [
                             const SizedBox(
                               height: 40,
                             ),
                             Lottie.asset('images/signuplottie.json',height: 150),
                            const SizedBox(height:40 ,),
                            CommonTextField(

                              hinttext: " UserName",
                              prefixicon: Icons.boy,
                              size: 25,
                              controller: signupScreenController.username,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter  Username";
                                }

                              }, iconcolor: ThemeColor,
                            ),const SizedBox(height: 30,),
                            CommonTextField(

                              hinttext: "Email Address",
                              prefixicon: Icons.email,
                              size: 25,
                              controller: signupScreenController.email,
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
                              height: 30,
                            ),
                            CommonTextField(

                              controller: signupScreenController.password,
                              obscureText: signupScreenController.passToggle,
                              hinttext: "Password",
                              prefixicon: Icons.lock,
                              size: 25,
                              suffixicon: IconButton(
                                onPressed: () {
                                  signupScreenController.passToggle =
                                  !signupScreenController.passToggle;
                                },
                                icon: Icon(signupScreenController.passToggle
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                color: ThemeColor,
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Enter  password";
                                }
                              }, iconcolor: ThemeColor,
                            ),SizedBox(height: 30,),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(280, 60),
                                    backgroundColor: const Color(0xFF433B67),
                                    disabledBackgroundColor: Colors.white,
                                    shape:RoundedRectangleBorder(

                                        borderRadius: BorderRadius.circular(30)
                                    ),
                                    elevation: 8.0
                                ),
                                onPressed: () async {
                                  // if (signupScreenController.formkey.currentState!.validate()) {
                                  //   Navigator.push(context, BouncyPageRoute(widget: WelcomeScreenView()));
                                  // };
                                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                                  await prefs.setString('name', signupScreenController.username.text);
                                  service
                                      .handleSignUp(signupScreenController.email.text,
                                      signupScreenController.password.text)

                                      .then((value) => {
                                  Navigator.push(context, BouncyPageRoute(widget: BottomnavigatScreenView())),
                                    _fire.SetData(
                                        context, signupScreenController.email.text, signupScreenController.password.text,signupScreenController.username.text),

                                  });
                                }, child: const Text('Sign Up',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,

                                fontSize: 25
                            ),)),const SizedBox(height: 100,),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, BouncyPageRoute(widget: LoginScreenView()));
                              },
                              child: RichText(text:  const TextSpan(
                                  text: " Already have an account??",style:  TextStyle(
                                fontFamily: "Poppins",
                                color: ThemeColor,
                                fontSize: 18,
                              ),
                                  children: [
                                    TextSpan(
                                      text:'Login',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Poppins",
                                        color: ThemeColor,
                                        fontSize: 20,
                                      ),
                                    )
                                  ]
                              )),
                            ),
                          ],
                        ),
                      ),
                  ],
                );

      }),
          ),


      ),
    );
  }
}
