import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxBool isDark = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    checkAppMode();
  }

  checkAppMode() {
    Timer.periodic(Duration(seconds: 2), (timer) {
      final darkMode = WidgetsBinding.instance.window.platformBrightness;
      if (darkMode == Brightness.dark) {
        isDark.value = true;
      } else {
        isDark.value = false;
      }
    });
  }
}