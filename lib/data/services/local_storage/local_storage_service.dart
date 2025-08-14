import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/result/result.dart';
import 'i_local_storage_service.dart';

class LocalStorageService implements ILocalStorageService {
  final FlutterSecureStorage _flutterSecureStorage;

  LocalStorageService({
    required FlutterSecureStorage flutterSecureStorage,
  }) : _flutterSecureStorage = flutterSecureStorage;

  @override
  Future<Result<Unit>> clearAuthToken() async {
    await _flutterSecureStorage.delete(key: 'auth_token');
    return successOfUnit();
  }

  @override
  Future<Result<String>> getAuthToken() async {
    final authToken = await _flutterSecureStorage.read(key: 'auth_token');

    if (authToken == null) {
      return Failure(Exception('No auth token found'));
    }

    return Success(authToken);
  }

  @override
  Future<Result<Unit>> saveAuthToken(String token) async {
    await _flutterSecureStorage.write(key: 'auth_token', value: token);
    return successOfUnit();
  }
}
