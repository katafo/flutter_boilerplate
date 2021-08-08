import 'package:app_structure/configs/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../api_client.dart';
import '../decodable.dart';

class AuthToken implements Decodable<AuthToken> {
  String accessToken;
  String? refreshToken;
  int? expiredTime;

  AuthToken({required this.accessToken, this.refreshToken, this.expiredTime});

  @override
  AuthToken decode(dynamic data) {
    expiredTime = data['expired_time'];
    return this;
  }

  Future startRefreshToken() async {
    await Future.delayed(const Duration(seconds: 5));
    // assign new access token
    accessToken = '';
  }

  bool isExpired() {
    return true;
  }
}

class AuthInterceptor extends InterceptorsWrapper {
  final APIClient client;
  AuthToken token;

  AuthInterceptor(this.client, this.token);

  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final authorize = options.extra[RequestExtraKeys.authorize] ?? false;
    if (!authorize) {
      return super.onRequest(options, handler);
    }

    if (token.isExpired()) {
      client.instance?.lock();
      debugPrint('Lock request for refreshing token...');
      await token.startRefreshToken();
      client.instance?.unlock();
      debugPrint('Refresh token completed!');
    }

    options.headers['Authorization'] = token.accessToken;

    return super.onRequest(options, handler);
  }
}
