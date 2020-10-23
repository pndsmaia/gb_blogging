import 'package:dio/dio.dart';

abstract class INetworkRepository {
  void setDioOptions();
  void setUrl(String url);
  Future<Response> getRequest(String endpoint, {Options options});
  Future<Response> postRequest(String endpoint, Map<dynamic, dynamic> body);
  Future<Response> putRequest(String endpoint, dynamic body, {Options options});
  Future<Response> deleteRequest(String endpoint, {Options options});
  Future<Response> patchRequest(String endpoint, {Options options});
}
