part of 'exam_bloc.dart';

abstract class ExamState {
  const ExamState();
}

final class ExamInitial extends ExamState {}

class ExamMainState extends ExamState {
  List<Question> questions;
  int selectedOption;
  int questionIndex;
  PageController pageController;
  int nextPageStep;

  ExamMainState(
      {required this.questions,
      this.selectedOption = -1,
      this.questionIndex = 0,
      this.nextPageStep = 0,
      required this.pageController});

  ExamMainState copyWith(
      {List<Question>? questions,
      int? selectedOption,
      int? questionIndex,
      int? nextPageStep,
      PageController? pageController}) {
    return ExamMainState(
        questions: questions ?? this.questions,
        selectedOption: selectedOption ?? this.selectedOption,
        questionIndex: questionIndex ?? this.questionIndex,
        nextPageStep: nextPageStep ?? this.nextPageStep,
        pageController: pageController ?? this.pageController);
  }
}
