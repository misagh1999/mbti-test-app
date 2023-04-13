import 'package:flutter/material.dart';

import 'constants.dart';
import 'utils/utils.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
      fontFamily: Fonts.Regular,
      primaryColor: primaryColor,
      splashColor: primaryColor,
      scaffoldBackgroundColor: HexColor.fromHex("#E7E7E7"),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: secondayColor, primary: primaryColor));
}