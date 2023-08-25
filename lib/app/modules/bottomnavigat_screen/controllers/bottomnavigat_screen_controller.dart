import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_turner/app/modules/home_screen/views/home_screen_view.dart';

import '../../cart_screen/views/cart_screen_view.dart';
import '../../favourite_screen/views/favourite_screen_view.dart';
import '../../profile_screen/views/profile_screen_view.dart';
import '../../search_screen/views/search_screen_view.dart';
import '../../signup_screen/views/signup_screen_view.dart';

class BottomnavigatScreenController extends GetxController {
  //TODO: Implement BottomnavigatScreenController
  final items = <Widget> [
    Icon(Icons.home,size: 30,color: Colors.white,),
    Icon(Icons.shopping_cart_rounded,size: 30,color: Colors.white,),
    Icon(Icons.search,size: 30,color: Colors.white,),
    Icon(Icons.favorite_border,size: 30,color: Colors.white,),
    Icon(Icons.person,size: 30,color: Colors.white,),
  ];
  final screens = [
    HomeScreenView(),
    CartScreenView(),
    SearchScreenView(),
    FavouriteScreenView(),
    ProfileScreenView(),

  ];
  int _index = 0;

  int get index => _index;

  set index(int value) {
    _index = value;
    update();
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
