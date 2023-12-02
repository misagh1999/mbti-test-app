import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../app_pages.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnim;
  late Animation<double> _imgFadeAnim;
  late Animation<double> _btnFadeAnim;

  late Animation<Offset> _slide1Anim;
  late Animation<Offset> _slide2Anim;
  late Animation<Offset> _slide3Anim;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  _initAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));

    _fadeAnim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.2, 0.5)));
    _imgFadeAnim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.5, 0.75)));
    _btnFadeAnim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.75, 1.0)));

    _slide1Anim = Tween(begin: Offset(0.0, -0.1), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.2, 0.5)));

    _slide2Anim = Tween(begin: Offset(0.0, -0.1), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.5, 0.75)));

    _slide3Anim = Tween(begin: Offset(0.0, 1.0), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.75, 1.0)));

    _animationController.forward();
  }

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
              SlideTransition(
                position: _slide1Anim,
                child: FadeTransition(
                  opacity: _fadeAnim,
                  child: Column(
                    children: [
                      _buildLogoWidget(),
                      SizedBox(
                        height: 16,
                      ),
                      _buildWelcomeTitleText(),
                      SizedBox(
                        height: 16,
                      ),
                      _buildDescriptionText(),
                    ],
                  ),
                ),
              ),
              Spacer(),
              _buildWelcomeImg(),
              Spacer(),
              _buildStartBtn(),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }

  SvgPicture _buildLogoWidget() {
    return SvgPicture.asset(
      Assets.LOGO,
      width: 48,
    );
  }

  RichText _buildWelcomeTitleText() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Welcome to\n',
          style: TextStyle(
              color: Colors.black, fontFamily: Fonts.Bold, fontSize: 22),
          children: [
            TextSpan(text: 'MBTI Test', style: TextStyle(color: primaryColor)),
            TextSpan(text: ' App')
          ]),
    );
  }

  Text _buildDescriptionText() {
    return Text(
      'An App you can find your \npersonality type',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: HexColor.fromHex('A0BBFF'),
          fontSize: 18,
          fontFamily: Fonts.Medium),
    );
  }

  SlideTransition _buildWelcomeImg() {
    return SlideTransition(
      position: _slide2Anim,
      child: FadeTransition(
          opacity: _imgFadeAnim, child: SvgPicture.asset(Assets.WELCOME_IMG)),
    );
  }

  SlideTransition _buildStartBtn() {
    return SlideTransition(
      position: _slide3Anim,
      child: FadeTransition(
        opacity: _btnFadeAnim,
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.START);
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            width: Get.width / 2,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: primaryColor),
            child: Center(
              child: Text(
                'Get Started',
                style:
                    TextStyle(color: Colors.white, fontFamily: Fonts.SemiBold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
