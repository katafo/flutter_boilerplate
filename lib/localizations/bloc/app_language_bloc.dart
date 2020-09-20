import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../app_language.dart';
import 'app_language_event.dart';
import 'app_language_state.dart';

class AppLanguageBloc extends Bloc<AppLanguageEvent, AppLanguageState> {

  final AppLanguage appLanguage = AppLanguage();

  @override
  AppLanguageState get initialState => AppLanguageInitial();

  @override
  Stream<AppLanguageState> mapEventToState(AppLanguageEvent event) async* {
    
    if (event is AppLanguageFetchLocale) {
      await appLanguage.fetchLocale();
      yield AppLanguageFetchLocaleCompleted(Locale(appLanguage.currentLocale));

    } else if (event is AppLanguageChangeLocale) {
      await appLanguage.changeLanguage(event.locale);
      yield AppLanguageFetchLocaleCompleted(Locale(event.locale));
    }

  }

}