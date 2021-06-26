import 'package:bgd_getx/bindings/login_binding.dart';
import 'package:bgd_getx/routes/get_pages.dart';
import 'package:bgd_getx/routes/get_views.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'Learn GetX',
      initialRoute: GetViews.LOGIN_SCREEN,
      initialBinding: LoginBinding(),
      getPages: GetPages.getPage,
    );
  }
}
