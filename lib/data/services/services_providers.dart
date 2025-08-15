import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../core/rest_client/backend_rest_client_provider.dart';
import 'auth/auth_service.dart';
import 'google_sign_in/google_sign_in_service.dart';
import 'google_sign_in/i_google_sign_in_service.dart';
import 'local_storage/i_local_storage_service.dart';
import 'local_storage/local_storage_service.dart';

part 'services_providers.g.dart';

@Riverpod(keepAlive: true)
ILocalStorageService localStorageService(Ref ref) {
  return LocalStorageService(flutterSecureStorage: FlutterSecureStorage());
}

@riverpod
IGoogleSignInService googleSignInService(Ref ref) {
  return GoogleSignInService();
}

@riverpod
AuthService authService(Ref ref) {
  return AuthService(ref.read(backendRestClientProvider));
}
