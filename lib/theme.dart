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

class AppTheme {

  ThemeData primary = ThemeData(

    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.backgroundColor,
    hintColor: AppColors.lightTextColor,

    textTheme: TextTheme(
      headline4: TextStyle(fontSize: 24, fontWeight: AppFontWeight.medium),
      headline5: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
      bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),

    ),

    fontFamily: 'HelveticaNeue',

  );

}

class AppStyle {

  ThemeData themeData;

  AppStyle({@required this.themeData});

  factory AppStyle.of(BuildContext context) {
    return AppStyle(themeData: Theme.of(context));
  }

  TextStyle defaultTextStyle() {
    return themeData.textTheme.bodyText2.copyWith(
      color: Colors.black
    );
  }

  TextStyle defaultTextFieldStyle() {
    return themeData.textTheme.bodyText2.copyWith(
      fontSize: 16,
      color: Colors.black,
      fontWeight: AppFontWeight.light
    );
  }

}
