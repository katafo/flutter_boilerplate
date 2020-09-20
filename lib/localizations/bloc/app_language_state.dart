import 'package:flutter/material.dart';

abstract class AppLanguageState {}

class AppLanguageInitial extends AppLanguageState {}

class AppLanguageFetchLocaleCompleted extends AppLanguageState {

  final Locale locale;
  AppLanguageFetchLocaleCompleted(this.locale);

}