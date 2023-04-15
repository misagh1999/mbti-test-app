import 'package:english_mbti_test_app/controllers/exam_controller.dart';
import 'package:get/get.dart';

class ExamBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExamController());
  }

}