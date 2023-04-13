import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/routes/app_pages.dart';
import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.LOGO,
                width: 48,
              ),
              SizedBox(
                height: 16,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Welcome to\n',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: Fonts.Bold,
                        fontSize: 22),
                    children: [
                      TextSpan(
                          text: 'MBTI Test',
                          style: TextStyle(color: primaryColor)),
                      TextSpan(text: ' App')
                    ]),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'An App you can find your \npersonality type',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: HexColor.fromHex('A0BBFF'),
                    fontSize: 18,
                    fontFamily: Fonts.Medium),
              ),
              Spacer(),
              SvgPicture.asset(Assets.WELCOME_IMG),
              Spacer(),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.START);
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: Get.width / 2,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: primaryColor),
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          color: Colors.white, fontFamily: Fonts.SemiBold),
                    ),
                  ),
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
