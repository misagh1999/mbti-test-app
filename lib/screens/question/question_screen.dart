import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/controllers/exam_controller.dart';
import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'components/option_widget.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({super.key});

  final ExamController _ = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => _.questionIndex.value != 0
                          ? _.previousQuestion()
                          : null,
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
                    ),
                    Spacer(),
                    Container(
                      height: 8,
                      width: Get.width - 200,
                      decoration: BoxDecoration(
                          color: HexColor.fromHex('E4E4E4'),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Container(
                            width:( (_.questionIndex.value + 1) / _.questions.length) * (Get.width - 200),
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () => _.questions[_.questionIndex.value]
                                  .selectedOption.value !=
                              0
                          ? _.nextQuestion()
                          : null,
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(Assets.NEXT_ICON,
                            height: 20,
                            color: _.questions[_.questionIndex.value]
                                        .selectedOption.value !=
                                    0
                                ? Colors.black
                                : Colors.grey.withOpacity(0.5)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'QUESTION ' +
                      (_.questionIndex.value + 1).toString() +
                      "/" +
                      _.questions.length.toString(),
                  style:
                      TextStyle(color: primaryColor, fontFamily: Fonts.Medium),
                ),
                InkWell(
                  onTap: (){
                    // todo: remove it later
                    _.goToResultScreenTest();
                  },
                  child: Container(
                    color: Colors.green,
                    margin: EdgeInsets.all(12),
                    padding: EdgeInsets.all(16),
                    child: Text('Go to result'),
                  ),
                ),
                Expanded(
                  child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _.pageController,
                    itemCount: _.questions.length,
                    itemBuilder: (context, index) => Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            ()=> OptionWidget(
                              text: _.questions[index].option1,
                              optionIndex: 1,
                              questionIndex: index,
                              press: () => _.submitAnswer(1),
                              isSelected:
                                  _.questions[index].selectedOption.value == 1,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Obx(
                            ()=> OptionWidget(
                              text: _.questions[index].option2,
                              optionIndex: 2,
                              questionIndex: index,
                              press: () => _.submitAnswer(2),
                              isSelected:
                                  _.questions[index].selectedOption.value == 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
