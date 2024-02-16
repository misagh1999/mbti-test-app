import 'package:english_mbti_test_app/presentation/blocs/exam/exam_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../utils/utils.dart';

class ProgressExamWidget extends StatelessWidget {
  ProgressExamWidget({
    super.key,
    required this.bloc,
  });
  final ExamBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildPreviousBtn(),
            Spacer(),
            _buildProgressBar(),
            Spacer(),
            _buildNextBtn(),
          ],
        ),
        SizedBox(
          height: 24,
        ),
        _buildCurrentQuestion(),
      ],
    );
  }

  Widget _buildProgressBar() {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        return (state is ExamMainState)
            ? Container(
                height: 8,
                width: Get.width - 200,
                decoration: BoxDecoration(
                    color: HexColor.fromHex('E4E4E4'),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Container(
                      width:
                          ((state.questionIndex + 1) / state.questions.length) *
                              (Get.width - 200),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                ),
              )
            : Container();
      },
    );
  }

  Widget _buildCurrentQuestion() {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        return (state is ExamMainState)
            ? Text(
                'QUESTION ' +
                    (state.questionIndex + 1).toString() +
                    "/" +
                    state.questions.length.toString(),
                style: TextStyle(color: primaryColor, fontFamily: Fonts.Medium),
              )
            : Container();
      },
    );
  }

  Widget _buildNextBtn() {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        return (state is ExamMainState)
            ? InkWell(
                onTap: () =>
                    state.questions[state.questionIndex].selectedOption.value !=
                            0
                        ? bloc.add(NextClickedEvent())
                        : null,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(Assets.NEXT_ICON,
                      height: 20,
                      color: state.questions[state.questionIndex].selectedOption
                                  .value !=
                              0
                          ? Colors.black
                          : Colors.grey.withOpacity(0.5)),
                ),
              )
            : Container();
      },
    );
  }

  Widget _buildPreviousBtn() {
    return BlocBuilder<ExamBloc, ExamState>(
      builder: (context, state) {
        return (state is ExamMainState)
            ? InkWell(
                onTap: () => state.questionIndex != 0
                    ? bloc.add(PreviousClickedEvent())
                    : null,
                borderRadius: BorderRadius.circular(12),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(
                    Assets.PREVIOUS_ICON,
                    height: 20,
                    color: state.questionIndex != 0
                        ? Colors.black
                        : Colors.grey.withOpacity(0.5),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}
