
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final database _fire = database();
class database {
  final FirebaseFirestore _fire = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  void SetData(BuildContext context, String email, String pass,String username) {
    String? currentUser=auth.currentUser?.uid;
    _fire.collection("User").doc(currentUser).set({
      "email": email,
      "password": pass,
      "UID": currentUser,
      "username":username,
    }).then((value) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("SuccessFull")));
    });
  }
  Future<Map<String, dynamic>> getcurrentuser() async {
    var collection = await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser?.uid).get();
    Map<String,dynamic> data={};
    if(collection.exists){
      data=collection.data()!;
    }

    return data;
  }

}
