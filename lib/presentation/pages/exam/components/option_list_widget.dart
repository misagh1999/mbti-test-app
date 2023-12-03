import 'package:english_mbti_test_app/presentation/blocs/exam/exam_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'option_widget.dart';

class OptionListWidget extends StatelessWidget {
  OptionListWidget({
    super.key,
    required this.bloc,
    required this.index,
  });

  final int index;
  final ExamBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildOption1(),
          SizedBox(
            height: 16,
          ),
          _buildOption2(),
        ],
      ),
    );
  }

  Widget _buildOption2() {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        if (state is ExamMainState) {
          return OptionWidget(
            text: state.questions[index].option2,
            optionIndex: 2,
            questionIndex: index,
            press: () => bloc.add(AnswerSubmitedEvent(optionIndex: 2)),
            isSelected: state.questions[index].selectedOption.value == 2,
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildOption1() {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        if (state is ExamMainState) {
          return OptionWidget(
            text: state.questions[index].option1,
            optionIndex: 1,
            questionIndex: index,
            press: () => bloc.add(AnswerSubmitedEvent(optionIndex: 1)),
            isSelected: state.questions[index].selectedOption.value == 1,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
