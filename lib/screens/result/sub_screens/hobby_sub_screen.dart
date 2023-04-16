import 'package:english_mbti_test_app/controllers/exam_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../utils/utils.dart';

class HobbySubScreen extends StatelessWidget {
  HobbySubScreen({
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
                  'Hobby',
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
            Text(
              _.result.hobby,
              style: TextStyle(color: HexColor.fromHex('5F5F5F'), fontSize: 16),
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  Assets.HOBBY_IMG,
                  height: Get.width / 2,
                ),
              ],
            ),
            SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
