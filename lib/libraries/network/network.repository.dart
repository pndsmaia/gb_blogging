import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gbblogging/libraries/network/network.repository.interface.dart';

class NetworkRepository extends Disposable implements INetworkRepository {
  // ignore: non_constant_identifier_names
  final String URL_BASE;
  final InterceptorsWrapper interceptor;

  Dio dio = Dio();

  NetworkRepository(this.URL_BASE, {this.interceptor}) {
    setDioOptions();
    if (interceptor != null) {
      dio.interceptors.add(interceptor);
    }
  }

  @override
  void setDioOptions() {
    dio.options..baseUrl = URL_BASE;
  }

  @override
  void setUrl(String url) {
    if (url != null) {
      dio.options..baseUrl = url;
    } else {
      dio.options..baseUrl = URL_BASE;
    }
  }

  @override
  Future<Response> deleteRequest(
    String endpoint, {
    Options options,
    String url,
  }) async {
    setUrl(url);
    Response response = await dio.delete(endpoint, options: options);
    return response;
  }

  @override
  Future<Response> getRequest(
    String endpoint, {
    Options options,
    String url,
    Map<String, dynamic> queryParameters,
  }) async {
    setUrl(url);
    Response response = await dio.get(
      endpoint,
      options: options,
      queryParameters: queryParameters,
    );

    return response;
  }

  @override
  Future<Response> patchRequest(
    String endpoint, {
    Options options,
    String url,
  }) async {
    setUrl(url);
    Response response = await dio.patch(endpoint, options: options);
    return response;
  }

  @override
  Future<Response> postRequest(
    String endpoint,
    dynamic body, {
    Options options,
    String url,
  }) async {
    setUrl(url);
    Response response = await dio.post(endpoint, data: body, options: options);
    return response;
  }

  @override
  Future<Response> putRequest(
    String endpoint,
    dynamic body, {
    Options options,
    String url,
  }) async {
    setUrl(url);
    Response response = await dio.put(endpoint, data: body, options: options);
    return response;
  }

  @override
  void dispose() {}
}
