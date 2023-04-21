import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/exam_controller.dart';
import 'option_widget.dart';

class OptionListWidget extends StatelessWidget {
  OptionListWidget({
    super.key,
    required this.index,
  });

  final int index;

  final ExamController _ = Get.find();

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

  Obx _buildOption2() {
    return Obx(
      () => OptionWidget(
        text: _.questions[index].option2,
        optionIndex: 2,
        questionIndex: index,
        press: () => _.submitAnswer(2),
        isSelected: _.questions[index].selectedOption.value == 2,
      ),
    );
  }

  Obx _buildOption1() {
    return Obx(
      () => OptionWidget(
        text: _.questions[index].option1,
        optionIndex: 1,
        questionIndex: index,
        press: () => _.submitAnswer(1),
        isSelected: _.questions[index].selectedOption.value == 1,
      ),
    );
  }
}
