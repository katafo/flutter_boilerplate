import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../configs/constants.dart';

class AppLanguage {
  String currentLocale = 'vi';

  final _storage = const FlutterSecureStorage();

  Future<void> fetchLocale() async {
    final locale = await _storage.read(key: Keystores.userLocale);
    if (locale == null) {
      currentLocale = 'en';
    } else {
      currentLocale = locale;
    }
  }

  Future<void> changeLanguage(String locale) async {
    currentLocale = locale;
    await _storage.write(key: Keystores.userLocale, value: locale);
  }
}
