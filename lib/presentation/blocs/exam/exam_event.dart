part of 'exam_bloc.dart';

@immutable
sealed class ExamEvent {}

class ExamPageCreated extends ExamEvent {}

class AnswerSubmitedEvent extends ExamEvent {
  final int optionIndex;
  AnswerSubmitedEvent({required this.optionIndex});
}

class PreviousClickedEvent extends ExamEvent {}

class NextClickedEvent extends ExamEvent {}

class BackExamPageClicked extends ExamEvent {}

class PageStepChanged extends ExamEvent {
  final int step;
  PageStepChanged({required this.step});
}
