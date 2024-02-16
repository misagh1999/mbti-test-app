import 'package:english_mbti_test_app/presentation/blocs/exam/exam_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import 'components/option_list_widget.dart';
import 'components/progress_exam_widget.dart';

class ExamPage extends StatefulWidget {
  ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  late ExamBloc _bloc;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _bloc = sl<ExamBloc>();
    _bloc.add(ExamPageCreated());
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ExamBloc>(
        create: (_) => _bloc,
        child: BlocConsumer<ExamBloc, ExamState>(
          listener: (context, state) {
            if (state is ExamMainState) {
              if (state.nextPageStep == 1) {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 250), curve: Curves.ease);
                _bloc.add(PageStepChanged(step: 0));
              } else if (state.nextPageStep == -1) {
                _pageController.previousPage(
                    duration: Duration(milliseconds: 250), curve: Curves.ease);
                _bloc.add(PageStepChanged(step: 0));
              }
            }
          },
          builder: (context, state) {
            if (state is ExamMainState) {
              return SafeArea(
                child: Container(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      ProgressExamWidget(
                        bloc: _bloc,
                      ),
                      Expanded(
                        child: PageView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _pageController,
                          itemCount: state.questions.length,
                          itemBuilder: (context, index) => OptionListWidget(
                            bloc: _bloc,
                            index: index,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
