import 'package:dio/dio.dart';
import 'api_response.dart';
import 'api_route.dart';
import 'decodable.dart';

// ignore: one_member_abstracts
abstract class BaseAPIClient {
  Future<ResponseWrapper<T>> request<T extends Decodable>({
    required APIRouteConfigurable route,
    required Create<T> create,
    dynamic data,
  });
}

class APIClient implements BaseAPIClient {
  final BaseOptions options;
  Dio? instance;

  APIClient(this.options) {
    instance = Dio(options);
  }

  @override
  Future<ResponseWrapper<T>> request<T extends Decodable>({
    required APIRouteConfigurable route,
    required Create<T> create,
    dynamic data,
  }) async {
    final config = route.getConfig();
    config?.baseUrl = options.baseUrl;
    config?.data = data;

    if (config == null) {
      throw ErrorResponse(message: 'Failed to load request options.');
    }

    final response = await instance?.fetch(config);
    final responseData = response?.data;

    if (response?.statusCode == 200) {
      return ResponseWrapper.init(create: create, json: responseData);
    }

    throw ErrorResponse.fromJson(data);
  }
}
