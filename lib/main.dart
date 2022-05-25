import 'package:dev_technologies_task/controller/main_controller.dart';
import 'package:dev_technologies_task/view/home_screen.dart';
import 'package:dev_technologies_task/view/start_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  getLoginValue();

  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['en', 'ar'],
    assetsDirectory: 'assets/lang/',
  );

  runApp(LocalizedApp(child: MyApp()));
}
bool isLoggedIn;

getLoginValue() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isLoggedIn = prefs.getBool('isLoggedIn')??false;
  print(isLoggedIn);
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.put(MainController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn ? HomePageScreen() : StartPageScreen(),
      localizationsDelegates: translator.delegates,
      locale: translator.locale,
      supportedLocales: translator.locals(),
    );
  }
}
