import 'package:english_mbti_test_app/controllers/exam_controller.dart';
import 'package:english_mbti_test_app/presentation/blocs/result/result_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants.dart';
import '../../../../utils/utils.dart';

class HobbySubScreen extends StatefulWidget {
  HobbySubScreen({
    super.key,
  });

  @override
  State<HobbySubScreen> createState() => _HobbySubScreenState();
}

class _HobbySubScreenState extends State<HobbySubScreen>
    with SingleTickerProviderStateMixin {
  // final ExamController _ = Get.find();

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
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        return (state is ResultMainState)
            ? Container(
                child: SingleChildScrollView(
                  child: FadeTransition(
                    opacity: _fade1,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            Text(
                              'Hobby',
                              style: TextStyle(
                                  fontFamily: Fonts.Bold, fontSize: 16),
                            ),
                            Spacer(),
                            Text(
                              state.result.type,
                              style: TextStyle(
                                  fontFamily: Fonts.Bold, fontSize: 22),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        SlideTransition(
                          position: _slide1,
                          child: Text(
                            state.result.hobby,
                            style: TextStyle(
                                color: HexColor.fromHex('5F5F5F'),
                                fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SlideTransition(
                              position: _slide1,
                              child: SvgPicture.asset(
                                Assets.HOBBY_IMG,
                                height: Get.width / 2,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        )
                      ],
                    ),
                  ),
                ),
              )
            : Container();
      },
    );
  }
}