import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors.dart';
import '../login_screen/controllers/login_screen_controller.dart';

class CommonTextField extends StatefulWidget {

  LoginScreenController loginScreenController = Get.put(LoginScreenController());
  final TextEditingController? controller;
  final IconData? prefixicon;

  final Widget? suffixicon;
  final String? hinttext;
  final String? Function(String?)? validator;
  final void Function()? onlick;
  final bool? obscureText;
  final double? size;
 // final Color color;
  final Color iconcolor;

   CommonTextField(
      {Key? key,
      this.controller,
      this.prefixicon,
      this.hinttext,
      this.validator,
      this.size,
        this.obscureText,
      this.suffixicon, this.onlick, required this.iconcolor, })
      : super(key: key);

  @override
  State<CommonTextField> createState() => _CommonTextFieldState();
}

class _CommonTextFieldState extends State<CommonTextField> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (LoginScreenController loginScreenController) {
        return SizedBox

          (

          width: 300,
          child: TextFormField(

            obscureText: widget.obscureText ?? false,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
                fontFamily: "Poppins", fontSize: 20, fontWeight: FontWeight.bold),
            cursorColor: ThemeColor,
            showCursor: true,
            controller: widget.controller,
            decoration: InputDecoration(

                filled: true,
                fillColor: const Color(0xFFcdcbdc),
                border:OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xFFcdcbdc), width: 3.0),
                    borderRadius: BorderRadius.circular(40)) ,
                focusColor: ThemeColor,
                focusedBorder: OutlineInputBorder(
                   borderSide: const BorderSide(color: ThemeColor, width: 3.0),
                    borderRadius: BorderRadius.circular(40)),
                enabled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide( color: Color(0xFFcdcbdc),width: 3),
                    borderRadius: BorderRadius.circular(40)
                ),

                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red, width: 1.0),
                    borderRadius: BorderRadius.circular(40)),
                prefixIcon: Icon(
                  widget.prefixicon,
                  size: widget.size,
                  color: widget.iconcolor,
                ),
                suffixIcon: widget.suffixicon,
                hintText: "${widget.hinttext}",
                hintStyle: const TextStyle(fontSize: 18, fontFamily: "Poppins",color: Colors.grey,fontWeight: FontWeight.bold)),
            validator: widget.validator,
          ),
        );
      }
    );
  }
}
