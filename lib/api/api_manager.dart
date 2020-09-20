enum APIType {
  listEmployees,
  detailsEmployee,
}

enum HttpMethod { post, get, put, delete }

class APIConfig {

  final String url;
  final HttpMethod method;
  Map<String, String> headers;

  APIConfig({this.url, this.method, this.headers});
  
}

class APIManager {

  final APIType type;
  final String routeParams;
  String baseURL = 'http://dummy.restapiexample.com/api/v1';

  APIManager({ this.type, this.baseURL, this.routeParams });

  /// Return config of api (method, url, header)
  APIConfig getConfig() {

    final headers = {
      'Content-Type': 'application/json',
    };

    final authHeaders = {
      "Authorization": 'Bearer YOUR_ACCESS_TOKEN'
    };
    
    authHeaders.addAll(headers);

    switch (type) {

      //login
      case APIType.listEmployees:
        return APIConfig(
          method: HttpMethod.get,
          url: '$baseURL/employees',
          headers: headers
      );
      
      case APIType.detailsEmployee:
        return APIConfig(
          method: HttpMethod.get,
          url: '$baseURL/employee/$routeParams',
          headers: headers
      );

      default:
        return null;

    }
  }
}
