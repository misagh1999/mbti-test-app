import 'package:english_mbti_test_app/screens/question/question_screen.dart';
import 'package:english_mbti_test_app/screens/result/result_screen.dart';
import 'package:english_mbti_test_app/screens/start/start_screen.dart';
import 'package:english_mbti_test_app/screens/welcome/welcome_screen.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.WELCOME, page: () => WelcomeScreen()),
    GetPage(name: Routes.START, page: () => StartScreen()),
    GetPage(name: Routes.QUESTION, page: () => QuestionScreen()),
    GetPage(name: Routes.RESULT, page: () => ResultScreen())
  ];
}
