import 'package:english_mbti_test_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../components/suggestion_item_widget.dart';

class SuggestionSubScreen extends StatelessWidget {
  const SuggestionSubScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Text(
                'Suggestions',
                style: TextStyle(fontFamily: Fonts.Bold, fontSize: 16),
              ),
              Spacer(),
              Text(
                'ISTP',
                style: TextStyle(fontFamily: Fonts.Bold, fontSize: 22),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          SuggestionItemWidget(),
          SuggestionItemWidget(),
          SuggestionItemWidget(),
        ],
      ),
    );
  }
}


