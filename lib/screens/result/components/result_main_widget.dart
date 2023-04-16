import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/controllers/exam_controller.dart';
import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ResultMainWidget extends StatelessWidget {
  ResultMainWidget({
    super.key,
  });

  final ExamController _ = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Personality Type',
                  style: TextStyle(
                      color: HexColor.fromHex('A4A4A4'), fontSize: 16),
                ),
                Text(
                  _.result.type,
                  style: TextStyle(fontFamily: Fonts.Bold, fontSize: 32),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  _.result.title,
                  style: TextStyle(
                      color: HexColor.fromHex('9D9D9D'), fontSize: 16),
                )
              ],
            ),
            Spacer(),
            SvgPicture.asset(
              Assets.IC_ESFP,
              height: Get.width / 2,
            )
          ],
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          'Favorite Sentence',
          style: TextStyle(fontFamily: Fonts.Bold, fontSize: 16),
        ),
        SizedBox(height: 8,),
        Text(
          _.result.favoriteSentence,
          style: TextStyle(
              color: HexColor.fromHex('A4A4A4'),
              fontSize: 20,
              fontFamily: Fonts.SemiBold),
        )
      ],
    );
  }
}
