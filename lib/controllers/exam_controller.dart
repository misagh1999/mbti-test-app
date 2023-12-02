import 'package:english_mbti_test_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/personality_model.dart';
import '../data/models/question.dart';
import '../presentation/pages/app_pages.dart';
import '../presentation/widgets/dialog.dart';

class ExamController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late PageController _pageController;
  PageController get pageController => this._pageController;

  late List<Question> _questions = sample_data
      .map((question) => Question(
          index: question['index'],
          option1: question['option1'],
          option2: question['option2'],
          selectedOption: 0.obs,
          type1: question['type1'],
          type2: question['type2']))
      .toList();

  List<Question> get questions => this._questions;

  late int _selectedOption;
  int get selectedOption => this._selectedOption;

  RxInt _questionIndex = 0.obs;
  RxInt get questionIndex => this._questionIndex;

  late PResultModel result;

  _resetExam() {
    _questions = sample_data
        .map((question) => Question(
            index: question['index'],
            option1: question['option1'],
            option2: question['option2'],
            selectedOption: 0.obs,
            type1: question['type1'],
            type2: question['type2']))
        .toList();
    _questionIndex.value = 0;
  }

  @override
  void onInit() {
    _pageController = PageController();
    _resetExam();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    _pageController.dispose();
  }

  void submitAnswer(int optionIndex) {
    _selectedOption = optionIndex;

    _questions[_questionIndex.value].selectedOption.value = optionIndex;

    Future.delayed(Duration(milliseconds: 250), () {
      nextQuestion();
    });
  }

  void previousQuestion() {
    if (_questionIndex > 0) {
      _questionIndex--;
      _pageController.previousPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      Get.snackbar("Error", "Can not go back");
    }
  }

  void nextQuestion() {
    if (questionIndex.value < _questions.length - 1) {
      _questionIndex++;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);
    } else {
      _calculateAndGoToResultScreen();
    }
  }

  void _calculateAndGoToResultScreen() async {
    String resultTypeStr = "";

    for (int i = 0; i < _questions.length; i++) {
      final q = _questions[i];
      String type = "";
      final selectedOption = q.selectedOption.value;
      if (selectedOption == 1) {
        type = q.type1;
      } else if (selectedOption == 2) {
        type = q.type2;
      }
      resultTypeStr += type;
    }

    final model = PersonalityModel.createFromCode(resultTypeStr);

    result = PResultModel(type: model.type);

    await result.loadResult();

    _resetExam();

    Get.offNamed(Routes.RESULT);
  }

  jumpToFakeResult() async {
    result = PResultModel(type: MBTI.ENFJ);

    await result.loadResult();

    _resetExam();

    Get.offNamed(Routes.RESULT);
  }

  onWillPopMain() {
    showExitDialog(onCancel: () {
      Get.back();
    }, onConfirm: () {
      Get.back();
      Get.back();
    });
  }
}
