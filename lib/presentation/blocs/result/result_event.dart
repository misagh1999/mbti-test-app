part of 'result_bloc.dart';

abstract class ResultEvent {}

class ResultPageCreated extends ResultEvent {
  final PResultModel result;
  ResultPageCreated({required this.result});
}

class PreviousBtnClicked extends ResultEvent {}

class NextBtnClicked extends ResultEvent {}

class PageStepChanged extends ResultEvent {
  final int step;
  PageStepChanged({required this.step});
}
