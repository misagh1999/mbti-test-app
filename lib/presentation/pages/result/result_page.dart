import 'package:english_mbti_test_app/controllers/result_controller.dart';
import 'package:english_mbti_test_app/data/models/personality_model.dart';
import 'package:english_mbti_test_app/presentation/blocs/result/result_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../injection_container.dart';
import 'components/result_bottom_widget.dart';
import 'components/result_main_widget.dart';
import 'components/result_top_widget.dart';
import 'sub_screens/description_sub_screen.dart';
import 'sub_screens/hobby_sub_screen.dart';
import 'sub_screens/relationship_sub_screen.dart';
import 'sub_screens/sugestion_sub_screen.dart';
import 'sub_screens/work_sub_screen.dart';

class ResultPage extends StatefulWidget {
  ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>  {
  // final ResultController resultController = Get.put(ResultController());

  late PageController _pageController;
  late ResultBloc _bloc;

  @override
  void initState() {
    super.initState();
    final PResultModel result = Get.arguments as PResultModel;
    _bloc = sl<ResultBloc>();
    _bloc.add(ResultPageCreated(result: result));
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => _bloc,
        child: BlocConsumer<ResultBloc, ResultState>(
          listener: (context, state) {
            if (state is ResultMainState) {
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
            return (state is ResultMainState)
                ? SafeArea(
                    child: Container(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: [
                          ResultTopWidget(),
                          Expanded(
                              child: PageView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  controller: _pageController,
                                  itemCount: _bloc.MAX_SECTION_INDEX + 1,
                                  itemBuilder: (context, index) {
                                    switch (index) {
                                      case 0:
                                        return ResultMainWidget();
                                      case 1:
                                        return DescriptionSubScreen();
                                      case 2:
                                        return WorkSubScreen();
                                      case 3:
                                        return RelationshipSubScreen();
                                      case 4:
                                        return HobbySubScreen();
                                      case 5:
                                        return SuggestionSubScreen();
                                      default:
                                        return SizedBox();
                                    }
                                  })),
                          ResultBottomWidget(
                            bloc: _bloc,
                          )
                        ],
                      ),
                    ),
                  )
                : Container();
          },
        ),
      ),
    );
  }
}
