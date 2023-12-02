import 'package:english_mbti_test_app/bindings/exam_bindings.dart';
import 'package:get/get.dart';

import 'exam/exam_page.dart';
import 'result/result_page.dart';
import 'start/start_page.dart';
import 'welcome/welcome_page.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.WELCOME, page: () => WelcomePage()),
    GetPage(
        name: Routes.START, page: () => StartPage(), binding: ExamBinding()),
    GetPage(name: Routes.QUESTION, page: () => ExamPage()),
    GetPage(name: Routes.RESULT, page: () => ResultPage())
  ];
}
