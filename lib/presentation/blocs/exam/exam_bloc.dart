import 'package:bloc/bloc.dart';
import 'package:english_mbti_test_app/data/models/question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/personality_model.dart';
import '../../pages/app_pages.dart';
import '../../widgets/dialog.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  ExamBloc() : super(ExamInitial()) {
    on<ExamPageCreated>(_onPageCreated);
    on<PreviousClickedEvent>((PreviousClickedEvent event, emit) =>
        _onPreviousAnswer(state, event, emit));
    on<NextClickedEvent>(
        (NextClickedEvent event, emit) => _onNextAnswer(state, event, emit));
    on<AnswerSubmitedEvent>((AnswerSubmitedEvent event, emit) async =>
        _onSubmit(state, emit, event));
    on<PageStepChanged>((PageStepChanged event, emit) =>
        _onPageStepChanged(state, event, emit));
    on<BackExamPageClicked>(_onBackClicked);
  }

  void _onPageStepChanged(state, PageStepChanged event, emit) {
    if (state is ExamMainState) {
      emit(state.copyWith(nextPageStep: event.step));
    }
  }

  void _onPageCreated(state, emit) async {
    List<Question> _questions = sample_data
        .map((question) => Question(
            index: question['index'],
            option1: question['option1'],
            option2: question['option2'],
            selectedOption: 0.obs,
            type1: question['type1'],
            type2: question['type2']))
        .toList();
    emit(
        ExamMainState(questions: _questions, pageController: PageController()));
  }

  void _onBackClicked(state, emit) async {
    showExitDialog(onCancel: () {
      Get.back();
    }, onConfirm: () {
      Get.back();
      Get.back();
    });
  }

  void _onPreviousAnswer(state, event, emit) {
    if (state is ExamMainState) {
      if (state.questionIndex > 0) {
        emit(
          state.copyWith(
              questionIndex: --state.questionIndex, nextPageStep: -1),
        );
      } else {
        Get.snackbar("Error", "Can not go back");
      }
    }
  }

  void _onNextAnswer(state, event, emit) {
    if (state is ExamMainState) {
      if (state.questionIndex < state.questions.length - 1) {
        emit(state.copyWith(
            questionIndex: ++state.questionIndex, nextPageStep: 1));
      } else {
        _calculateAndGoToResultScreen(state, emit);
      }
    }
  }

  void _calculateAndGoToResultScreen(ExamMainState state, emit) async {
    String resultTypeStr = "";

    for (int i = 0; i < state.questions.length; i++) {
      final q = state.questions[i];
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

    // todo: implement later
    // result = PResultModel(type: model.type);

    // await result.loadResult();

    _onPageCreated(state, emit);

    Get.offNamed(Routes.RESULT);
  }

  void _onSubmit(state, emit, event) async {
    if (state is ExamMainState) {
      var changedQuestions = state.questions;
      changedQuestions[state.questionIndex].selectedOption.value =
          event.optionIndex;
      emit(state.copyWith(
          selectedOption: event.optionIndex, questions: changedQuestions));

      await Future.delayed(Duration(milliseconds: 250), () {
        _onNextAnswer(state, event, emit);
      });
    }
  }
}
