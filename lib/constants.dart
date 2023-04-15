import 'utils/utils.dart';

var primaryColor = HexColor.fromHex('527BE2');
var secondayColor = HexColor.fromHex('F0E823');

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

  //MBTI
  static const IC_ENFJ = 'assets/icons/mbti/ENFJ.svg';
  static const IC_ENFP = 'assets/icons/mbti/ENFP.svg';
  static const IC_ENTJ = 'assets/icons/mbti/ENTJ.svg';
  static const IC_ENTP = 'assets/icons/mbti/ENTP.svg';
  static const IC_ESFJ = 'assets/icons/mbti/ESFJ.svg';
  static const IC_ESFP = 'assets/icons/mbti/ESFP.svg';
  static const IC_ESTJ = 'assets/icons/mbti/ESTJ.svg';
  static const IC_ESTP = 'assets/icons/mbti/ESTP.svg';
  static const IC_INFJ = 'assets/icons/mbti/INFJ.svg';
  static const IC_INFP = 'assets/icons/mbti/INFP.svg';
  static const IC_INTJ = 'assets/icons/mbti/INTJ.svg';
  static const IC_INTP = 'assets/icons/mbti/INTP.svg';
  static const IC_ISFJ = 'assets/icons/mbti/ISFJ.svg';
  static const IC_ISFP = 'assets/icons/mbti/ISFP.svg';
  static const IC_ISTJ = 'assets/icons/mbti/ISTJ.svg';
  static const IC_ISTP = 'assets/icons/mbti/ISTP.svg';
}

abstract class MyString {
  static const DESCRIPTION_DEMO =
      'The ENFJ type is a person who is interested and kind, and notices the admirable qualities of others. He can relate to a variety of people. The ENFJ type is an excellent communicator, a natural leader, and very skilled at motivating and persuading others. At work, he is likely to be very success-oriented and likes to get what he wants. This type is knowledgeable, disciplined, goal-oriented, and decisive, and expects the same from others.';
  static const SUGGESTION_DEMO =
      'Dont ask to do everything. Some things can be done later and some things cant be done at all.';
}
