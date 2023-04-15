import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/models/personality_model.dart';
import '../data/models/question.dart';
import '../routes/app_pages.dart';

class ExamController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions = sample_data
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

  @override
  void onInit() {
    _pageController = PageController();
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

    Future.delayed(Duration(milliseconds: 350), () {
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

  void _calculateAndGoToResultScreen() {
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

    Get.toNamed(Routes.RESULT, arguments: {"model": model});
  }
}
