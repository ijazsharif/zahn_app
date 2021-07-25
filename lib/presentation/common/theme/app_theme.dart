import 'package:flutter/material.dart';
import 'package:zahn_app/presentation/common/color/app_colors.dart';

class AppTheme {
  static final defaultTheme = ThemeData(
    scaffoldBackgroundColor: ColorPalette.fogra,
    splashColor: ColorPalette.fogra,
    fontFamily: 'Mont',
    textTheme: TextTheme(
      headline1: TextStyle(
        fontWeight: FontWeight.w900,
        color: ColorPalette.snowWhite,
      ),
      headline2: TextStyle(
        fontWeight: FontWeight.w700,
        color: ColorPalette.snowWhite,
      ),
      headline3: TextStyle(
        fontWeight: FontWeight.w500,
        color: ColorPalette.snowWhite,
      ),
      headline4: TextStyle(
        fontWeight: FontWeight.w300,
        color: ColorPalette.snowWhite,
      ),
    ),
  );
}
