import 'package:english_mbti_test_app/controllers/exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/option_list_widget.dart';
import 'components/progress_exam_widget.dart';

class ExamPage extends StatelessWidget {
  ExamPage({super.key});

  final ExamController _ = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return _.onWillPopMain();
        },
        child: SafeArea(
          child: Obx(
            () => Container(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  ProgressExamWidget(),
                  Expanded(
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _.pageController,
                      itemCount: _.questions.length,
                      itemBuilder: (context, index) => OptionListWidget(
                        index: index,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
