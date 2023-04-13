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

  static const PREVIOUS_ICON = 'assets/icons/previous_icon.svg';
  static const NEXT_ICON = 'assets/icons/next_icon.svg';
}
