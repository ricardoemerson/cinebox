import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../config/env.dart';

part 'tmdb_rest_client_provider.g.dart';

@Riverpod(keepAlive: true)
Dio tmdbRestClient(Ref ref) {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.theMovieDbApiUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
    ),
  );

  // Optionally, you can set headers or interceptors here
  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Authorization'] = 'Bearer ${Env.theMovieDbApiKey}';

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
