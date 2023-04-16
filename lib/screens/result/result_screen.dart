import 'package:english_mbti_test_app/controllers/result_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/result_bottom_widget.dart';
import 'components/result_main_widget.dart';
import 'components/result_top_widget.dart';
import 'sub_screens/description_sub_screen.dart';
import 'sub_screens/hobby_sub_screen.dart';
import 'sub_screens/relationship_sub_screen.dart';
import 'sub_screens/sugestion_sub_screen.dart';
import 'sub_screens/work_sub_screen.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});

  final ResultController resultController = Get.put(ResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              ResultTopWidget(),
              Expanded(
                  child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      controller: resultController.pageController,
                      itemCount: resultController.MAX_SECTION_INDEX + 1,
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
              ResultBottomWidget()
            ],
          ),
        ),
      ),
    );
  }
}
