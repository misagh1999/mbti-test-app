import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/personality_model.dart';

part 'result_event.dart';
part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  int MAX_SECTION_INDEX = 5;

  ResultBloc() : super(ResultInitial()) {
    on<ResultPageCreated>(
        (ResultPageCreated event, emit) => _onPageCreated(event, emit));
    on<PreviousBtnClicked>((PreviousBtnClicked event, emit) =>
        _onPreviousBtnClicked(state, event, emit));
    on<NextBtnClicked>(
        (NextBtnClicked event, emit) => _onNextBtnClicked(state, event, emit));
    on<PageStepChanged>((PageStepChanged event, emit) =>
        _onPageStepChanged(state, event, emit));
  }

  _onPageCreated(ResultPageCreated event, emit) {
    emit(ResultMainState(result: event.result));
  }

  _onPreviousBtnClicked(state, event, emit) {
    if (state is ResultMainState) {
      emit(
          state.copyWith(sectionIndex: --state.sectionIndex, nextPageStep: -1));
      _updateTitles(state, emit);
    }
  }

  _onNextBtnClicked(state, event, emit) {
    if (state is ResultMainState) {
      emit(state.copyWith(sectionIndex: ++state.sectionIndex, nextPageStep: 1));
      _updateTitles(state, emit);
    }
  }

  void _updateTitles(ResultMainState state, emit) {
    final previousTitle = _getPreviousTitle(state.sectionIndex);
    final nextTitle = _getNextTitle(state.sectionIndex);
    final isPreviousBtnEnabled = _isPreviousBtnEnabled(state.sectionIndex);
    final isNextBtnEnabled = _isNextBtnEnabled(state.sectionIndex);
    
    emit(state.copyWith(
        previousTitle: previousTitle,
        nextTitle: nextTitle,
        isPreviousBtnEnabled: isPreviousBtnEnabled,
        isNextBtnEnabled: isNextBtnEnabled));
  }

  void _onPageStepChanged(state, PageStepChanged event, emit) {
    if (state is ResultMainState) {
      emit(state.copyWith(nextPageStep: event.step));
    }
  }

  bool _isPreviousBtnEnabled(int index) {
    bool enabled = index != 0;
    return enabled;
  }

  bool _isNextBtnEnabled(int index) {
    bool enabled = index < MAX_SECTION_INDEX;
    return enabled;
  }

  String _getNextTitle(int index) {
    String title2;
    title2 = "";
    switch (index) {
      case 0:
        title2 = "Description";
        break;
      case 1:
        title2 = "Work";
        break;
      case 2:
        title2 = "Relationship";
        break;
      case 3:
        title2 = "Hobby";
        break;
      case 4:
        title2 = "Suggestions";
        break;
      case 5:
        title2 = " ";
        break;
      default:
    }
    return title2;
  }

  String _getPreviousTitle(int index) {
    String title2;
    title2 = "";
    switch (index) {
      case 0:
        title2 = " ";
        break;
      case 1:
        title2 = "Main";
        break;
      case 2:
        title2 = "Description";
        break;
      case 3:
        title2 = "Work";
        break;
      case 4:
        title2 = "Relationship";
        break;
      case 5:
        title2 = "Hobby";
        break;
      default:
    }
    return title2;
  }
}
