import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:page_turner/app/colors.dart';

import '../../../firestore.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {


  HomeScreenController homeScreenController = Get.put(HomeScreenController());
   HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: GetBuilder(
          builder: (HomeScreenController homeScreenController) {
          return Column(
            children: [
                    SizedBox(height: 30,),
                   const Center(
                     child: Text('Bookshelf',style: TextStyle(
                       fontSize: 35,
                       color: ThemeColor,
                       fontWeight: FontWeight.bold,
                       fontFamily: "Poppins"
                     ),),
                   ),const SizedBox(height: 20,),
               Container(
                 height: 80,
                 width: 330,
                 decoration: BoxDecoration(
                   // boxShadow: [
                   //   BoxShadow(
                   //     offset: Offset(0,5),
                   //     blurRadius: 90,
                   //     color: Colors.grey,
                   //   )
                   // ],
                   borderRadius: BorderRadius.circular(40),
                   color: Colors.white38,
                 ),
                 child: Row(
                   children:  [
                    Padding(
                      padding: const EdgeInsets.only(right:100.0,top: 12),
                      child: Text('welcome back. \n${homeScreenController.name}!',style: const TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700
                      ),),
                    ) ,
                       Container(
                         height: 60,
                         width: 60,
                         decoration: const BoxDecoration(
                             shape: BoxShape.circle, color: Colors.grey),
                         child:  FittedBox(
                           fit: BoxFit.fill,
                           child: CircleAvatar(
                             backgroundImage: FileImage(
                               File(homeScreenController.img),
                             ),
                           ),
                         ),
                       )
                   ],
                 ),
               ),SizedBox(height: 100,),
               const Padding(
                 padding: EdgeInsets.only(right: 130),
                 child: Text('It can be \ninteresting for You',style: TextStyle(

                   fontSize: 25,
                   fontFamily: "Roboto Slab"
                 ),),
               ),

              // SizedBox(
              //   height: 100,
              //   child: GridView.builder(
              //     shrinkWrap: true,
              //     scrollDirection: Axis.horizontal,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), itemBuilder: (context, index) {
              //     return  Container(
              //       height: 170,
              //       width: 120,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: Colors.cyan,
              //         image: DecorationImage(
              //             image: AssetImage("images/book2.jpeg"),
              //
              //             fit: BoxFit.cover),
              //       ),
              //     );
              //   },),
              // ),
              SizedBox(
                height: 174,
                child: GridView.builder(

                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2/1.7,
                        crossAxisCount: 1),
                    itemBuilder: (context, index) {
                      return  Padding(
                        padding: const EdgeInsets.only(left: 30,top: 10),
                        child: Container(
                          margin: EdgeInsets.all(3),

                          height: 170,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.cyan,
                            image: DecorationImage(
                                image: AssetImage("images/book2.jpeg"),

                                fit: BoxFit.cover),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 100,
                child: GridView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 45    ,
                      crossAxisCount: 1), itemBuilder:(context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left:50.0,top: 10),
                    child: Text('data',style: TextStyle(
                      fontSize: 20
                    ),),
                  );
                },),
              )
            ],
          );
          }
        ),
      ),
    );
  }
}
