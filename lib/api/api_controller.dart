import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'api_manager.dart';
import 'api_response.dart';
import 'decodable.dart';

/// Contruct to handle network request
class APIController {

  APIController._();

  /// Send an HTTP request based on APIManager
  static Future<ResponseWrapper<T>> request<T extends Decodable>({
    @required APIManager manager, 
    @required Create<T> create, 
    Map<String, dynamic> body, 
    Map<String, String> query 
  }) async {
    
    final config = manager.getConfig();
    
    final response = await requestHandler(
      config: config, 
      body: body, 
      query: query
    );
    
    final responseJson = jsonDecode(response.body);
    
    if (response.statusCode == 200) {
      return ResponseWrapper.init(create: create, json: responseJson);
    }
    
    final error = ErrorResponse.fromJson(responseJson);
    
    throw error ?? ErrorResponse(
      message: 'Request failed with status code: ${response.statusCode}'
    );

  }

  static Future<Response> requestHandler({ 
    APIConfig config, 
    Map<String, dynamic> body,
    Map<String, String> query
  }) async {

    Response response;

    switch (config.method) {

      case HttpMethod.post:
        response = await post(
          config.url,
          headers: config.headers,
          body: body
        );
        break;

      case HttpMethod.get:
        response = await get(
          config.url + Uri(queryParameters: query).toString(), 
          headers: config.headers
        );
        break;

      case HttpMethod.put:
        response = await put(
          config.url,
          headers: config.headers,
          body: body
        );
        break;

      case HttpMethod.delete:
        response = await delete(
          config.url,
          headers: config.headers
        );
        break;
      
      default:
        throw ErrorResponse(message: 'Failed to detect http method');

    }

    return response;

  }

}

