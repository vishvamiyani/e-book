

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:page_turner/app/colors.dart';

import '../../../firestore.dart';
import '../controllers/profile_screen_controller.dart';

class ProfileScreenView extends GetView<ProfileScreenController> {

  final FirebaseFirestore _firee = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  Map<String,dynamic> data={};
  final database _fire = database();
  ProfileScreenController profileScreenController =
      Get.put(ProfileScreenController());

  ProfileScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: GetBuilder(
            builder: (ProfileScreenController profileScreenController) {
              return Column(
        children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          Icons.chevron_left,
                          size: 30,
                          color: Colors.black,
                        )),
                    const Text(
                      "  Profile",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.isDarkMode
                              ? Get.changeTheme(ThemeData.light())
                              : Get.changeTheme(ThemeData.dark());
                        },
                        icon: const Icon(
                          Icons.dark_mode,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              // Stack(
              //   children: [
              //     Container(
              //       height: 150,
              //       width: 150,
              //          decoration: BoxDecoration(
              //            shape: BoxShape.circle,
              //            border: Border.all(
              //              color: Colors.black,
              //              width: 5
              //            )
              //          ),
              //       child: ClipRRect(
              //         borderRadius: BorderRadius.circular(100),
              //         child: InkWell(
              //           onTap: (){
              //             profileScreenController.onpress();
              //           },
              //           child: profileScreenController.pickedimage == null
              //  ? Positioned(
              // bottom: 0,
              // right: 0,
              // child: Container(
              // width: 45,
              // height: 45,
              // decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(100),color: ThemeColor
              // ),
              // child: Icon(Icons.edit,color: Colors.white,size: 25,)))
              //
              //
              //
              //     :Image(
              //             fit: BoxFit.cover,
              //             image:AssetImage(),
              //
              //             loadingBuilder: (context ,child,loadingProcess){
              //               if(loadingProcess == null) return child;
              //               return Center(child: CircularProgressIndicator());
              //             },
              //             errorBuilder: (context ,object,stack){
              //               return Container(
              //                 child: Icon(Icons.error_outline,color: Colors.red,),
              //               );
              //             },
              //           ),
              //         ),
              //       ),
              //     ),
              //
              //   ],
              // ),

          Container(
            height: 120,
            width: 120,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.grey),
            child: InkWell(
              onTap: () async {
                profileScreenController.onpress();
              },
              child: profileScreenController.pickedimage == null
                  ? const Icon(
                Icons.add_a_photo_rounded,
                size: 48,
              )
                  : FittedBox(
                fit: BoxFit.fill,
                child: CircleAvatar(
                  backgroundImage: FileImage(
                  File(profileScreenController.pickedimage!.path)
                  ),
                ),
              ),
            ),
          ),
          Text(data!['username'] ?? "vishva",style: const TextStyle(
                  fontSize: 17,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w700
              ),),
        ],
      );
            }
          )),
    );
  }

}
