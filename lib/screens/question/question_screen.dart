import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/routes/app_pages.dart';
import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'components/option_widget.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    Assets.PREVIOUS_ICON,
                    height: 20,
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
                          width: Get.width - 200 - 50,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: (){
                      // tood: fix it later (it is just implemented for test)
                      Get.toNamed(Routes.RESULT);
                    },
                    child: SvgPicture.asset(
                      Assets.NEXT_ICON,
                      height: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'QUESTION 1/60',
                style: TextStyle(color: primaryColor, fontFamily: Fonts.Medium),
              ),
              Spacer(),
              OptionWidget(
                text: 'I usually keep my feelings and emotions to myself.',
              ),
              SizedBox(height: 16,),
              OptionWidget(
                text: 'I usually share my feelings and emotions with others easily.',
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
