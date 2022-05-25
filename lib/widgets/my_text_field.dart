import 'package:dev_technologies_task/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTextField extends StatelessWidget {
  MainController mainController = Get.find();
  TextEditingController controller;
  String label;
  bool obsecureText =false;
  IconButton suffixIcon;
  final ValueChanged<String> onChanged;
  Function onEditingComplete;
  GestureTapCallback onTap;
  bool enabled=true;
  int maxLines;
  String hintText;
  TextInputType keyboardType;
  bool autoFocus;
  double height;
  double width;
  int maxLength;
  int minLines;
  FocusNode focusNode;
  bool phoneNumber=false;
  double fontSize;
  ///Constructor
  MyTextField({
    @required this.controller,
    @required this.label,
    this.obsecureText,
    this.onChanged,
    this.suffixIcon,
    this.onEditingComplete,
    this.enabled,
    this.onTap,
    this.maxLines,
    this.hintText,
    this.keyboardType,
    this.autoFocus,
    this.height,
    this.width,
    this.maxLength,
    this.focusNode,
    this.phoneNumber,
    this.fontSize,
    this.minLines
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height??45,
      width: width,
      color: mainController.isDark.value ? Color(0xff212130) : Color(0xffF3F4FC),
      child: GestureDetector(
        onTap: onTap,
        child: TextField(
          style: TextStyle(fontSize: 16, color: mainController.isDark.value ? Colors.white54 : Colors.grey),
          minLines: minLines,
          focusNode: focusNode,
          maxLength: maxLength,
          autofocus: autoFocus??false,
          keyboardType: keyboardType,
          maxLines: maxLines??1,
          enabled: enabled,
          onTap: onTap,
          onEditingComplete: onEditingComplete,
          onChanged:onChanged,
          controller: controller,
          obscureText: obsecureText??false,
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintStyle: TextStyle(
              color: mainController.isDark.value ? Colors.white54 : Colors.grey,
              fontSize: 16
            ),
            labelStyle: TextStyle(
                color: mainController.isDark.value ? Colors.white54 : Colors.grey,
                fontSize: 16
            ),
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.transparent
                )
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.transparent
                )
            ),
            focusedBorder:  const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.transparent
                )
            ),
            border: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.transparent
                )
            ),
            // hintText: label,
          ),
        ),
      ),
    );
  }
}