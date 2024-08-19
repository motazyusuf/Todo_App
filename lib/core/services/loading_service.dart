import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


void configLoading(){
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..maskType = EasyLoadingMaskType.black
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.white
    ..indicatorColor = Color(0xFF509CEC)
    ..textColor = Colors.white
    ..userInteractions = false
    ..dismissOnTap = false;

}