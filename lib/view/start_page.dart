import 'package:dev_technologies_task/view/login_screen.dart';
import 'package:dev_technologies_task/view/sign_up_screen.dart';
import 'package:dev_technologies_task/widgets/my_border_button.dart';
import 'package:dev_technologies_task/widgets/my_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:localize_and_translate/localize_and_translate.dart';

class StartPageScreen extends StatefulWidget {

  @override
  State<StartPageScreen> createState() => _StartPageScreenState();
}

class _StartPageScreenState extends State<StartPageScreen> {
  RxBool isArabic = false.obs;
  RxBool isEnglish = false.obs;
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    print(myLocale);
    if(myLocale.languageCode == 'ar') {
      isArabic.value = true;
    }
    else {
      isEnglish.value = true;
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
            height: Get.height, // ignore this, cos I am giving height to the container
            width: Get.width, // ignore this, cos I am giving width to the container
            decoration: const BoxDecoration(
              color: Colors.black
              // image: DecorationImage(
              //     fit: BoxFit.cover,
              //     image: AssetImage('assets/image1.jpg')
              // )
            ),
            alignment: Alignment.bottomCenter, // This aligns the child of the container
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0,left: 10, right: 10), //some spacing to the child from bottom
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text("languageText".tr(), style: const TextStyle(color: Colors.white, fontSize: 20),),
                      const SizedBox(width: 15,),
                      Obx(
                        () => GestureDetector(
                          onTap: () async {
                            isEnglish.value = !isEnglish.value;
                            isArabic.value = false;
                            await translator.setNewLanguage(
                              context,
                              newLanguage: 'en',
                              remember: true,
                              restart: true,
                            );
                          },
                          child: Container(
                            height: 30,
                            color: isEnglish.value ? Color(0xff46AA6E) : Colors.white,
                            child:  Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Text("English", style: TextStyle(color: isEnglish.value ? Colors.white : Colors.black, fontSize: 16),),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Obx(
                        () => GestureDetector(
                          onTap: () async {
                            isArabic.value = !isArabic.value;
                            isEnglish.value = false;
                            await translator.setNewLanguage(
                              context,
                              newLanguage: 'ar',
                              remember: true,
                              restart: true,
                            );
                          },
                          child: Container(
                            height: 30,
                            color: isArabic.value ? Color(0xff46AA6E) : Colors.white,
                            child:  Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Text("Arabic", style: TextStyle(color: isArabic.value ? Colors.white : Colors.black, fontSize: 16),),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text('welcomeMessageOne'.tr(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)),
                  Text('welcomeMessageTwo'.tr(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40)),
                  const SizedBox(height: 10,),
                  MyFilledButton(
                    height: 55,
                    width: double.infinity,
                    borderRadius: 5,
                    fontSize: 16,
                    txtColor: Colors.white,
                    txt: 'Login Hapnezz',
                    ontap: () {
                      Get.to(() => LoginScreen());
                    },
                  ),
                  const SizedBox(height: 10,),
                  MyBorderButton(
                    height: 55,
                    width: double.infinity,
                    color: Colors.transparent,
                    borderRadius: 5,
                    fontSize: 16,
                    txtColor: Colors.green,
                    borderColor: Colors.green,
                    txt: 'Sign Up',
                    ontap: () {
                      Get.to(() => SignUpScreen());
                    },
                  ),
                ],
              )
            )
        )
      ),
    );
  }
}
