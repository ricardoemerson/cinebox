import '../../../core/result/result.dart';

abstract interface class ILocalStorageService {
  Future<Result<Unit>> saveAuthToken(String token);

  Future<Result<String>> getAuthToken();

  Future<Result<Unit>> clearAuthToken();
}
