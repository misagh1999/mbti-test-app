import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../controllers/exam_controller.dart';
import '../../../../utils/utils.dart';

class ProgressExamWidget extends StatelessWidget {
  ProgressExamWidget({
    super.key,
  });

  final ExamController _ = Get.find();

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

  Container _buildProgressBar() {
    return Container(
      height: 8,
      width: Get.width - 200,
      decoration: BoxDecoration(
          color: HexColor.fromHex('E4E4E4'),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            width: ((_.questionIndex.value + 1) / _.questions.length) *
                (Get.width - 200),
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(5)),
          ),
        ],
      ),
    );
  }

  Text _buildCurrentQuestion() {
    return Text(
      'QUESTION ' +
          (_.questionIndex.value + 1).toString() +
          "/" +
          _.questions.length.toString(),
      style: TextStyle(color: primaryColor, fontFamily: Fonts.Medium),
    );
  }

  InkWell _buildNextBtn() {
    return InkWell(
      onTap: () => _.questions[_.questionIndex.value].selectedOption.value != 0
          ? _.nextQuestion()
          : null,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(Assets.NEXT_ICON,
            height: 20,
            color: _.questions[_.questionIndex.value].selectedOption.value != 0
                ? Colors.black
                : Colors.grey.withOpacity(0.5)),
      ),
    );
  }

  InkWell _buildPreviousBtn() {
    return InkWell(
      onTap: () => _.questionIndex.value != 0 ? _.previousQuestion() : null,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SvgPicture.asset(
          Assets.PREVIOUS_ICON,
          height: 20,
          color: _.questionIndex.value != 0
              ? Colors.black
              : Colors.grey.withOpacity(0.5),
        ),
      ),
    );
  }
}
