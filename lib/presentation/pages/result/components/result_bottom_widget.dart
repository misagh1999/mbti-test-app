import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/presentation/blocs/result/result_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultBottomWidget extends StatelessWidget {
  ResultBottomWidget({
    required this.bloc,
    super.key,
  });

  final ResultBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultBloc, ResultState>(
      builder: (context, state) {
        return (state is ResultMainState)
            ? Container(
                child: Row(
                  children: [
                    Expanded(
                      child: state.isPreviousBtnEnabled
                          ? NavigationBtn(
                              title: state.previousTitle,
                              color: state.result.lightColor,
                              isNext: false,
                              press: () => bloc.add(PreviousBtnClicked()))
                          : SizedBox(),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: state.isNextBtnEnabled
                          ? NavigationBtn(
                              title: state.nextTitle,
                              color: state.result.darkColor,
                              isNext: true,
                              press: () => bloc.add(NextBtnClicked()))
                          : SizedBox(),
                    ),
                  ],
                ),
              )
            : Container();
      },
    );
  }
}

class NavigationBtn extends StatelessWidget {
  const NavigationBtn({
    super.key,
    required this.title,
    required this.color,
    required this.isNext,
    required this.press,
  });

  final String title;
  final Color color;
  final bool isNext;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(25)),
        child: isNext
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: Fonts.SemiBold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SvgPicture.asset(
                    Assets.NEXT_ICON,
                    height: 16,
                    color: Colors.white,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.PREVIOUS_ICON,
                    height: 16,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: Fonts.SemiBold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                ],
              ),
      ),
    );
  }
}
