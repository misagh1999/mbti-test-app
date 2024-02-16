import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/presentation/blocs/result/result_bloc.dart';
import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ResultMainWidget extends StatefulWidget {
  ResultMainWidget({
    super.key,
  });

  @override
  State<ResultMainWidget> createState() => _ResultMainWidgetState();
}

class _ResultMainWidgetState extends State<ResultMainWidget>
    with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _fade1;
  late Animation<double> _fade2;

  late Animation<Offset> _slideAnim;

  _initAnimation() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2500));
    _fade1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.15, 0.5)));
    _fade2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _animationController, curve: Interval(0.5, 1.0)));

    _slideAnim = Tween(begin: Offset(0.0, 0.2), end: Offset.zero).animate(
        CurvedAnimation(
            parent: _animationController, curve: Interval(0.5, 1.0)));

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    _initAnimation();
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        return (state is ResultMainState)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24,
                  ),
                  FadeTransition(
                    opacity: _fade1,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your Personality Type',
                              style: TextStyle(
                                  color: HexColor.fromHex('A4A4A4'),
                                  fontSize: 16),
                            ),
                            Text(
                              state.result.type,
                              style: TextStyle(
                                  fontFamily: Fonts.Bold, fontSize: 32),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              state.result.title,
                              style: TextStyle(
                                  color: HexColor.fromHex('9D9D9D'),
                                  fontSize: 16),
                            )
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          state.result.imgPath,
                          height: Get.width / 2.5,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  FadeTransition(
                    opacity: _fade2,
                    child: Text(
                      'Favorite Sentence',
                      style: TextStyle(fontFamily: Fonts.Bold, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  SlideTransition(
                    position: _slideAnim,
                    child: FadeTransition(
                      opacity: _fade2,
                      child: Text(
                        state.result.favoriteSentence,
                        style: TextStyle(
                            color: HexColor.fromHex('A4A4A4'),
                            fontSize: 20,
                            fontFamily: Fonts.SemiBold),
                      ),
                    ),
                  )
                ],
              )
            : Container();
      },
    );
  }
}
