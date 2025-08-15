import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/services_providers.dart';
import 'auth/auth_repository.dart';
import 'auth/i_auth_repository.dart';

part 'repositories_providers.g.dart';

@riverpod
IAuthRepository authRepository(Ref ref) {
  return AuthRepository(
    localStorageService: ref.read(localStorageServiceProvider),
    googleSigninService: ref.read(googleSignInServiceProvider),
    authService: ref.read(authServiceProvider),
  );
}
