import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/env.dart';

part 'backend_rest_client_provider.g.dart';

@Riverpod(keepAlive: true)
Dio backendRestClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.backendUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  // Optionally, you can set headers or interceptors here
  dio.options.headers['Content-Type'] = 'application/json';

  // Add interceptors, headers, etc. if needed
  dio.interceptors.add(
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ),
  );

  return dio;
}
