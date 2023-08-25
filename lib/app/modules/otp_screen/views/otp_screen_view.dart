import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../authfirebase.dart';
import '../../../colors.dart';
import '../../home_screen/views/home_screen_view.dart';
import '../controllers/otp_screen_controller.dart';

class OtpScreenView extends GetView<OtpScreenController> {
  OtpScreenController otpScreenController = Get.find<OtpScreenController>();
   OtpScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body:GetBuilder(
          builder: (OtpScreenController otpScreenController) {
            return Column(
              children:   [
                const SizedBox(height: 50,),
                const Center(
                  child: Text('Verification',style: TextStyle(
                      fontSize: 22,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Container(
                    height: 300,
                    width: 300,
                    child: Lottie.asset('images/otp.json')),
                 const SizedBox(height: 30,),
                OtpTextField(
                  borderColor: ThemeColor,
                  focusedBorderColor:const Color(0xFF5AC490),
                  cursorColor: ThemeColor,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                  fieldWidth: 45,

                  borderRadius: BorderRadius.circular(100),

                  handleControllers: (controllers) {
                    otpScreenController.otp;
                  },
                  numberOfFields: 6,
                  enabledBorderColor: ThemeColor,
                  showFieldAsBox: true,

                  borderWidth: 3.0,
                  onSubmit: (value) {
                    otpScreenController.verificationCode = value;
                    otpScreenController.update();
                  },
                ),const SizedBox(height: 25,),
                InkWell(
                  onTap: () {
                   // Get.to(LoginScreenView());
                  },
                  child: RichText(text:  const TextSpan(
                      text: "If You didn't receive code,",style:  TextStyle(

                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontSize: 15,
                  ),
                      children: [
                        TextSpan(
                          text:'Resend',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                            color: Color(0xFF5AC490),
                            fontSize: 18,
                          ),
                        ),
                      ],
                  )),
                ),const SizedBox(height: 130,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(260, 60),
                        backgroundColor: ThemeColor,
                        disabledBackgroundColor: Colors.white,
                        shape:RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(30)
                        ),
                        elevation: 8.0
                    ),
                    onPressed: (){
                      PhoneAuthCredential Credential = PhoneAuthProvider.credential(
                          verificationId: Get.arguments,
                          smsCode:otpScreenController.verificationCode );
                      try {
                        service.auth
                            .signInWithCredential(Credential)
                            .then((value) {
                          Get.to( HomeScreenView);
                        });
                      } catch (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text("Verify")));
                      }
                    }, child:const Text('Verify')),
              ],
            );
          }
        )
      ),
    );
  }
}
