import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/controllers/exam_controller.dart';
import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DescriptionSubScreen extends StatefulWidget {
  DescriptionSubScreen({
    super.key,
  });

  @override
  State<DescriptionSubScreen> createState() => _DescriptionSubScreenState();
}

class _DescriptionSubScreenState extends State<DescriptionSubScreen>
    with SingleTickerProviderStateMixin {
  final ExamController _ = Get.find();

  late AnimationController _animationController;
  late Animation<double> _fade1;

  late Animation<Offset> _slide1;

  _initAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _fade1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.2, 1.0)));
    _slide1 = Tween(begin: Offset(0.0, 0.2), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.2, 1.0)));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    _initAnimation();
    return FadeTransition(
      opacity: _fade1,
      child: Container(
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
            SlideTransition(
              position: _slide1,
              child: Text(
                _.result.desc,
                style: TextStyle(color: HexColor.fromHex('5F5F5F'), fontSize: 16),
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SlideTransition(
                  position: _slide1,
                  child: SvgPicture.asset(
                    _.result.imgPath,
                    height: Get.width / 2,
                  ),
                ),
              ],
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
