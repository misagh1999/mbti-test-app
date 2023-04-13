import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
      fontFamily: Fonts.Regular,
      primaryColor: primaryColor,
      splashColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: secondayColor, primary: primaryColor));
}
