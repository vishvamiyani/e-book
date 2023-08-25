import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favourite_screen_controller.dart';

class FavouriteScreenView extends GetView<FavouriteScreenController> {
  const FavouriteScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FavouriteScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FavouriteScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
