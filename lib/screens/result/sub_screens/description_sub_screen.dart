import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/controllers/exam_controller.dart';
import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DescriptionSubScreen extends StatelessWidget {
  DescriptionSubScreen({
    super.key,
  });

  final ExamController _ = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                'Description',
                style: TextStyle(fontFamily: Fonts.Bold, fontSize: 16),
              ),
              Spacer(),
              Text(
                _.result.type,
                style: TextStyle(fontFamily: Fonts.Bold, fontSize: 22),
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            _.result.desc,
            style: TextStyle(color: HexColor.fromHex('5F5F5F'), fontSize: 16),
          ),
          Spacer(flex: 3,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                _.result.imgPath,
                height: Get.width / 2,
              ),
            ],
          ),
          Spacer()
        ],
      ),
    );
  }
}
