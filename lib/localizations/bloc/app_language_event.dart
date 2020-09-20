abstract class AppLanguageEvent {}

class AppLanguageFetchLocale extends AppLanguageEvent {}

class AppLanguageChangeLocale extends AppLanguageEvent {

  final String locale;
  AppLanguageChangeLocale(this.locale);

  @override
  String toString() {
    return 'AppLanguageChangeLocale: {locale: $locale}';
  }

}