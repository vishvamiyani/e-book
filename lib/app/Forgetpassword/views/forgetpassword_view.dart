import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:page_turner/app/modules/common%20widgets/common_textfield.dart';
import 'package:page_turner/app/modules/login_screen/views/login_screen_view.dart';

import '../../authfirebase.dart';
import '../../colors.dart';
import '../controllers/forgetpassword_controller.dart';

class ForgetpasswordView extends GetView<ForgetpasswordController> {
  Auth Authservices = Auth();
  final auth = FirebaseAuth.instance;
  ForgetpasswordController verificationController =
      Get.put(ForgetpasswordController());

  ForgetpasswordView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: GetBuilder(
          builder: (ForgetpasswordController verificationController) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 35),
              child: Text(
                '''To recover your password, you need
to enter your registerd email address
we will send the recovery code to\nyour number''',
                style: TextStyle(color: Color(0xFF000000), fontSize: 15),
              ),
            ),

            // Image.asset(
            //   'asset/Mobile login-bro.png',
            //   height: 200,
            // ),
            const SizedBox(
              height: 70,
            ),
            const ListTile(
              title: Text(
                '         Enter Email Address',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            CommonTextField(
              hinttext: "Email Address",
              prefixicon: Icons.email,
              size: 25,
              controller: verificationController.email,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter  Email";
                }
                bool emailvalid =
                    RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value!);
                if (!emailvalid) {
                  return "Enter Valid Email";
                }
              },
              iconcolor: ThemeColor,
            ),
            ElevatedButton(
              onPressed: () {
                auth.sendPasswordResetEmail(email: verificationController.email.text.toString()).then((value) => {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('we have send email '))),
                });
              },
              child: Text("Send OTP"),
            ),
          ],
        );
      }),
    ));
  }
}
