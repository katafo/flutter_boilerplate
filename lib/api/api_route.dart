import 'package:app_structure/configs/constants.dart';
import 'package:dio/dio.dart';

enum APIType { listEmployees, detailsEmployee, refreshToken }

class APIRoute implements APIRouteConfigurable {
  final APIType type;
  final String? routeParams;

  APIRoute(this.type, {this.routeParams});

  /// Return config of api (method, url, header)
  @override
  RequestOptions? getConfig() {
    // extra for inteceptor check auth
    const authorize = {RequestExtraKeys.authorize: true};

    switch (type) {
      case APIType.listEmployees:
        return RequestOptions(
            path: '/employees', method: APIMethod.get, extra: authorize);

      case APIType.detailsEmployee:
        return RequestOptions(
          path: '/employees/$routeParams',
          method: APIMethod.get,
        );

      default:
        return null;
    }
  }
}

// ignore: one_member_abstracts
abstract class APIRouteConfigurable {
  RequestOptions? getConfig();
}

class APIMethod {
  static const get = 'get';
  static const post = 'post';
  static const put = 'put';
  static const patch = 'patch';
  static const delete = 'delete';
}
