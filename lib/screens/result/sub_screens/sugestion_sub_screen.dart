import 'package:english_mbti_test_app/controllers/exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../components/suggestion_item_widget.dart';

class SuggestionSubScreen extends StatelessWidget {
  SuggestionSubScreen({
    super.key,
  });

  final ExamController _ = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Text(
                  'Suggestions',
                  style: TextStyle(fontFamily: Fonts.Bold, fontSize: 16),
                ),
                Spacer(),
                Text(
                  _.result.type,
                  style: TextStyle(fontFamily: Fonts.Bold, fontSize: 22),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            for(String item in _.result.sugesstions)
            SuggestionItemWidget(text: item,),
          ],
        ),
      ),
    );
  }
}
