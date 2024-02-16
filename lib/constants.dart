import 'package:flutter/material.dart';

import 'utils/utils.dart';

var primaryColor = HexColor.fromHex('527BE2');
var secondayColor = HexColor.fromHex('F0E823');

var primaryGradint =
    LinearGradient(colors: [primaryColor.withOpacity(0.8), primaryColor]);

abstract class Fonts {
  static const Light = 'Light';
  static const Regular = 'Regular';
  static const Medium = 'Medium';
  static const SemiBold = 'SemiBold';
  static const Bold = 'Bold';
  static const ExtraBold = 'ExtraBold';
}

abstract class Assets {
  static const LOGO = 'assets/images/temp_logo.svg';
  static const WELCOME_IMG = 'assets/images/welcome_img.svg';
  static const START_IMG = 'assets/images/start_img.svg';
  static const WORK_IMG = 'assets/images/work_img.svg';
  static const RELATIONSHIP_IMG = 'assets/images/relationship_img.svg';
  static const HOBBY_IMG = 'assets/images/hobby_img.svg';

  static const PREVIOUS_ICON = 'assets/icons/previous_icon.svg';
  static const NEXT_ICON = 'assets/icons/next_icon.svg';
  static const BACK_ICON = 'assets/icons/back_icon.svg';
}

abstract class MBTI {
  static const ENFJ = "ENFJ";
  static const ENFP = "ENFP";
  static const ENTJ = "ENTJ";
  static const ENTP = "ENTP";
  static const ESFJ = "ESFJ";
  static const ESFP = "ESFP";
  static const ESTJ = "ESTJ";
  static const ESTP = "ESTP";
  static const INFJ = "INFJ";
  static const INFP = "INFP";
  static const INTJ = "INTJ";
  static const INTP = "INTP";
  static const ISFJ = "ISFJ";
  static const ISFP = "ISFP";
  static const ISTJ = "ISTJ";
  static const ISTP = "ISTP";
}

abstract class MyString {
  static const DESCRIPTION_DEMO =
      'The ENFJ type is a person who is interested and kind, and notices the admirable qualities of others. He can relate to a variety of people. The ENFJ type is an excellent communicator, a natural leader, and very skilled at motivating and persuading others. At work, he is likely to be very success-oriented and likes to get what he wants. This type is knowledgeable, disciplined, goal-oriented, and decisive, and expects the same from others.';
  static const SUGGESTION_DEMO =
      'Dont ask to do everything. Some things can be done later and some things cant be done at all.';
}
