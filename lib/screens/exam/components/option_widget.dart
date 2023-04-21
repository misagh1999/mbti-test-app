import 'package:english_mbti_test_app/constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class OptionWidget extends StatelessWidget {
  OptionWidget({
    super.key,
    required this.text,
    required this.optionIndex,
    required this.questionIndex,
    this.isSelected = false,
    required this.press,
  });

  final String text;
  final VoidCallback press;
  final bool isSelected;
  final int optionIndex;
  final int questionIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: isSelected ? primaryColor : HexColor.fromHex('EEEEEE'),
          borderRadius: BorderRadius.circular(20)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: press,
          borderRadius: BorderRadius.circular(20),
          child: AnimatedContainer(
            width: double.infinity,
            padding: EdgeInsets.all(24),
            duration: Duration(milliseconds: 300),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: isSelected ? Fonts.SemiBold : Fonts.Regular,
                  color:
                      isSelected ? Colors.white : HexColor.fromHex('626262')),
            ),
          ),
        ),
      ),
    );
  }
}
