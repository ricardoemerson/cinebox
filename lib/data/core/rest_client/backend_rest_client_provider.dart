import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/env.dart';
import '../../../core/result/result.dart';
import '../../services/services_providers.dart';

part 'backend_rest_client_provider.g.dart';

class BackendInterceptor extends Interceptor {
  final Ref ref;

  BackendInterceptor({required this.ref});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final localStorage = ref.read(localStorageServiceProvider);
    final result = await localStorage.getAuthToken();

    if (result case Success(value: final authToken)) {
      options.headers['Authorization'] = 'Bearer $authToken';
    }

    handler.next(options);
  }
}

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
  dio.interceptors.addAll([
    BackendInterceptor(ref: ref),
    LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      error: true,
    ),
  ]);

  return dio;
}
