import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:e_commerce/app/modules/detail_item/views/detail_item_view.dart';
import 'package:e_commerce/app/modules/homepage/views/homepage_view.dart';
import 'package:e_commerce/app/modules/introduction/views/introduction_view.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    GetMaterialApp(
      title: "I-TAILOR",
      home: FlutterSplashScreen.scale(
        backgroundColor: Colors.pink,
        childWidget: Image.asset(
          'assets/Vector.png',
          scale: 1,
        ),
        duration: const Duration(milliseconds: 1500),
        animationDuration: const Duration(milliseconds: 1000),
        nextScreen: DetailItemView(),
      ),
    ),
  );
}
