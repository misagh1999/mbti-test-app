import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
            HexColor.fromHex('527BE2'),
            HexColor.fromHex('1E4BBE')
          ])),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24),
                height: Get.height - 150,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'MBTI Test',
                          style:
                              TextStyle(fontFamily: Fonts.Bold, fontSize: 18),
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          Assets.LOGO,
                          width: 36,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Center(
                      child: SvgPicture.asset(
                        Assets.START_IMG,
                        width: Get.width / 1.5,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Easy, reliable\nand good result',
                      style: TextStyle(fontFamily: Fonts.Bold, fontSize: 36),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Item #1,  by taking this test you can find your character and make sure you can find based you ideas',
                      style: TextStyle(
                          fontSize: 18, color: HexColor.fromHex('949494')),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(12),
                width: Get.width / 1.5,
                decoration: BoxDecoration(
                    color: HexColor.fromHex('F0E823'),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    'Start Test',
                    style: TextStyle(fontFamily: Fonts.SemiBold, fontSize: 18),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
