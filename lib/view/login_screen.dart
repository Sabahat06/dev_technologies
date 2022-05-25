import 'package:dev_technologies_task/controller/auth_ontroller.dart';
import 'package:dev_technologies_task/controller/main_controller.dart';
import 'package:dev_technologies_task/view/home_screen.dart';
import 'package:dev_technologies_task/view/sign_up_screen.dart';
import 'package:dev_technologies_task/widgets/my_filled_button.dart';
import 'package:dev_technologies_task/widgets/my_text_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide Trans;
import 'package:localize_and_translate/localize_and_translate.dart';

class LoginScreen extends StatelessWidget {
  MainController mainController = Get.find();
  AuthController authController = AuthController();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  RxBool isSelected = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: mainController.isDark.value ? Colors.black : Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 18,
          title: Text('back'.tr(), style: TextStyle(fontSize: 16, color: mainController.isDark.value ? Colors.white : Colors.black),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: mainController.isDark.value ? Colors.white : Colors.black, size: 18,),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height*0.05,),
                Text('welcomeMessageOne'.tr(), style: TextStyle(color: mainController.isDark.value ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 35)),
                Text('welcomeMessageTwo'.tr(), style: TextStyle(color: mainController.isDark.value ? Colors.white : Colors.black, fontWeight: FontWeight.bold, fontSize: 35)),
                SizedBox(height: Get.height*0.03,),
                MyTextField(
                  controller: email,
                  label: 'Email@youremail.com',
                  hintText: 'Email@youremail.com',
                  obsecureText: false,
                  keyboardType: TextInputType.emailAddress,
                  height: 55,
                ),
                SizedBox(height: Get.height*0.02,),
                MyTextField(
                  controller: password,
                  label: 'Password',
                  hintText: 'Password',
                  obsecureText: true,
                  height: 55,
                ),
                SizedBox(height: Get.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => GestureDetector(
                            onTap: () {
                              isSelected.value = !isSelected.value;
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: isSelected.value ? Colors.blue : mainController.isDark.value ? const Color(0xff212130) : Color(0xffF3F4FC),
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: const Center(
                                child: Icon(Icons.done, size: 20, color: Colors.white54,),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        Text('remember'.tr(), style: TextStyle(color: mainController.isDark.value ? Colors.white54 : Colors.grey, fontSize: 16)),
                      ],
                    ),
                    Text('forgotPassword'.tr(), style: TextStyle(color: mainController.isDark.value ? const Color(0xff46AA6E) : Colors.blue, fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: Get.height*0.03,),
                Obx(
                  () => authController.progressing.value
                      ? const Center(child: CircularProgressIndicator(color: Color(0xff46AA6E)),)
                      : MyFilledButton(
                        height: 55,
                        width: double.infinity,
                        borderRadius: 5,
                        fontSize: 16,
                        txtColor: Colors.white,
                        txt: 'Login to Hapnezz',
                        ontap: () {
                          if(signInValidation()) {
                            authController.signIn(email.text, password.text);
                          }
                        },
                      ),
                ),
                SizedBox(height: Get.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('or'.tr(), style: TextStyle(fontSize: 16, color: mainController.isDark.value ? Colors.white : Colors.grey,),textAlign: TextAlign.center,),
                  ],
                ),
                SizedBox(height: Get.height*0.02,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyFilledButton(
                      height: 55,
                      width: Get.width*0.45,
                      borderRadius: 5,
                      fontSize: 16,
                      txtColor: Colors.white,
                      color: Colors.red,
                      txt: 'Google',
                      ontap: () {},
                    ),
                    MyFilledButton(
                      height: 55,
                      width: Get.width*0.45,
                      borderRadius: 5,
                      fontSize: 16,
                      txtColor: Colors.white,
                      color: Colors.blue,
                      txt: 'Facebook',
                      ontap: () {
                        // Get.to(() => LoginScreen());
                      },
                    ),
                  ],
                ),
                SizedBox(height: Get.height*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("loginMessage".tr(), style: TextStyle(fontSize: 16, color: mainController.isDark.value ? Colors.white : Colors.grey),),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => SignUpScreen());
                      },
                      child: Text(
                        "signUp".tr(),
                        style: TextStyle(
                          fontSize: 16,
                          color: mainController.isDark.value ? Color(0xff46AA6E) : Colors.blue,
                        )
                      )
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool signInValidation() {
    if(email.text.trim().length==0) {
      Fluttertoast.showToast(msg: 'Please enter your email');
      return false;
    }
    else if (!GetUtils.isEmail(email.text)){
      Fluttertoast.showToast(msg: 'Email format is not correct');
      return false;
    }
    else if (password.text.trim().length==0) {
      Fluttertoast.showToast(msg: 'Please enter your password');
      return false;
    }
    else
      return true;
  }

}
