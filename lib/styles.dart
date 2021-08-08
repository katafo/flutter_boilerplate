import 'package:flutter/material.dart';
import 'commons/utils/app_colors.dart';

class AppFontWeight {
  static const thin = FontWeight.w100;
  static const extraLight = FontWeight.w200;
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const semiBold = FontWeight.w600;
  static const bold = FontWeight.w700;
  static const extraBold = FontWeight.w800;
  static const ultraBold = FontWeight.w900;
}

abstract class AppStyles {
  ThemeData? themeData;

  TextStyle? defaultTextStyle();
  TextStyle? defaultTextFieldStyle();
}

class DefaultAppStyles implements AppStyles {
  @override
  ThemeData? themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.backgroundColor,
    hintColor: AppColors.lightTextColor,
    textTheme: const TextTheme(
      headline4: TextStyle(fontSize: 24, fontWeight: AppFontWeight.medium),
      headline5: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
    ),
    fontFamily: 'HelveticaNeue',
  );

  @override
  TextStyle? defaultTextStyle() {
    return themeData?.textTheme.bodyText2?.copyWith(color: Colors.black);
  }

  @override
  TextStyle? defaultTextFieldStyle() {
    return themeData?.textTheme.bodyText2?.copyWith(
        fontSize: 16, color: Colors.black, fontWeight: AppFontWeight.light);
  }
}
