import 'package:dio/dio.dart';
import '../config/app_config.dart';
import '../utils/utils.dart';

/// A robust networking service powered by Dio.
class DioService {
  DioService._();
  static final DioService instance = DioService._();

  // --- HTTP Methods ---

  FutureEither<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return runTask(() => AppConfig.dio.get(path, queryParameters: queryParameters), requiresNetwork: true);
  }

  FutureEither<Response> post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return runTask(() => AppConfig.dio.post(path, data: data, queryParameters: queryParameters), requiresNetwork: true);
  }

  FutureEither<Response> put(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return runTask(() => AppConfig.dio.put(path, data: data, queryParameters: queryParameters), requiresNetwork: true);
  }

  FutureEither<Response> patch(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return runTask(() => AppConfig.dio.patch(path, data: data, queryParameters: queryParameters), requiresNetwork: true);
  }

  FutureEither<Response> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return runTask(() => AppConfig.dio.delete(path, data: data, queryParameters: queryParameters), requiresNetwork: true);
  }
}
