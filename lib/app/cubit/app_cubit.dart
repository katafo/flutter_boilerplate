import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../localizations/app_language.dart';
import '../../styles.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppStyles styles = DefaultAppStyles();
  AppLanguage language = AppLanguage();

  AppCubit(AppState state) : super(AppInitial());

  void changeStyle(AppStyles styles) {
    this.styles = styles;
    emit(AppChangeStyleSuccess());
  }

  Future<void> fetchLocale() async {
    await language.fetchLocale();
    emit(AppLanguageFetchLocaleCompleted(Locale(language.currentLocale)));
  }

  Future<void> changeLanguage(String locale) async {
    await language.changeLanguage(locale);
    emit(AppLanguageFetchLocaleCompleted(Locale(locale)));
  }
}
