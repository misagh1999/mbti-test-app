import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/controllers/exam_controller.dart';
import 'package:english_mbti_test_app/routes/app_pages.dart';
import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class StartScreen extends StatefulWidget {
  StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  final ExamController examController = Get.put(ExamController());

  late AnimationController _animationController;
  late Animation<double> _fade1;
  late Animation<double> _fade2;
  late Animation<double> _fade3;

  late Animation<Offset> _slide1;
  late Animation<Offset> _slide2;
  late Animation<Offset> _slide3;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  _initAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));

    _fade1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.1, 0.5)));
    _fade2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.5, 0.75)));
    _fade3 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.75, 1.0)));

    _slide1 = Tween(begin: Offset(0.0, -0.5), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.5, 0.75)));
    _slide2 = Tween(begin: Offset(0.0, 0.5), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.5, 0.75)));
    _slide3 = Tween(begin: Offset(0.0, 0.5), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.75, 1.0)));

    _animationController.forward();
  }

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
                    FadeTransition(
                      opacity: _fade1,
                      child: Column(
                        children: [
                          _buildTopWidget(),
                          SizedBox(
                            height: 36,
                          ),
                          _buildStartImg(),
                        ],
                      ),
                    ),
                    Spacer(),
                    _buildTitle(),
                    SizedBox(
                      height: 24,
                    ),
                    _buildDescription(),
                    Spacer(),
                  ],
                ),
              ),
              Spacer(),
              _buildStartTestBtn(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildTopWidget() {
    return Row(
      children: [
        Text(
          'MBTI Test',
          style: TextStyle(fontFamily: Fonts.Bold, fontSize: 18),
        ),
        Spacer(),
        SvgPicture.asset(
          Assets.LOGO,
          width: 36,
        )
      ],
    );
  }

  Center _buildStartImg() {
    return Center(
      child: SvgPicture.asset(
        Assets.START_IMG,
        width: Get.width / 1.5,
      ),
    );
  }

  SlideTransition _buildTitle() {
    return SlideTransition(
      position: _slide1,
      child: FadeTransition(
        opacity: _fade2,
        child: Text(
          'Easy, reliable\nand good result',
          style: TextStyle(fontFamily: Fonts.Bold, fontSize: 36),
        ),
      ),
    );
  }

  SlideTransition _buildDescription() {
    return SlideTransition(
      position: _slide2,
      child: FadeTransition(
        opacity: _fade2,
        child: Text(
          'Item #1,  by taking this test you can find your character and make sure you can find based you ideas',
          style: TextStyle(fontSize: 18, color: HexColor.fromHex('949494')),
        ),
      ),
    );
  }

  SlideTransition _buildStartTestBtn() {
    return SlideTransition(
      position: _slide3,
      child: FadeTransition(
        opacity: _fade3,
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.QUESTION);
          },
          child: Container(
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
        ),
      ),
    );
  }
}
