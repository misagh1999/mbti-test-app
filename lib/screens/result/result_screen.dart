import 'package:english_mbti_test_app/constants.dart';
import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/result_bottom_widget.dart';
import 'components/result_main_widget.dart';
import 'components/result_top_widget.dart';
import 'sub_screens/description_sub_screen.dart';
import 'sub_screens/relationship_sub_screen.dart';
import 'sub_screens/work_sub_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

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
                  child:
                      // ResultMainWidget()
                      // DescriptionSubScreen()
                      // WorkSubScreen()
                      RelationshipSubScreen()
                      ),
              ResultBottomWidget()
            ],
          ),
        ),
      ),
    );
  }
}




