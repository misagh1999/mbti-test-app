part of 'result_bloc.dart';

abstract class ResultState {}

class ResultInitial extends ResultState {}

class ResultMainState extends ResultState {
  String previousTitle;
  String nextTitle;
  bool isPreviousBtnEnabled;
  bool isNextBtnEnabled;
  int sectionIndex;
  int nextPageStep;
  PResultModel result;

  ResultMainState(
      {required this.result,
      this.previousTitle = '',
      this.nextTitle = 'Description',
      this.nextPageStep = 0,
      this.sectionIndex = 0,
      this.isNextBtnEnabled = true,
      this.isPreviousBtnEnabled = false});

  ResultMainState copyWith(
      {PResultModel? result,
      String? previousTitle,
      String? nextTitle,
      int? sectionIndex,
      int? nextPageStep,
      bool? isNextBtnEnabled,
      bool? isPreviousBtnEnabled}) {
    return ResultMainState(
        result: result ?? this.result,
        previousTitle: previousTitle ?? this.previousTitle,
        nextTitle: nextTitle ?? this.nextTitle,
        nextPageStep: nextPageStep ?? this.nextPageStep,
        sectionIndex: sectionIndex ?? this.sectionIndex,
        isNextBtnEnabled: isNextBtnEnabled ?? this.isNextBtnEnabled,
        isPreviousBtnEnabled:
            isPreviousBtnEnabled ?? this.isPreviousBtnEnabled);
  }
}
