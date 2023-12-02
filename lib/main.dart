import 'package:english_mbti_test_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'presentation/pages/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'MBTI Test APP',
      theme: lightThemeData(context),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: Routes.WELCOME,
      defaultTransition: Transition.fade,
    );
  }
}
