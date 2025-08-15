import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/result/result.dart';
import '../../exceptions/data_exception.dart';
import '../../services/auth/auth_service.dart';
import '../../services/google_sign_in/i_google_sign_in_service.dart';
import '../../services/local_storage/i_local_storage_service.dart';
import 'i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  final ILocalStorageService _localStorageService;
  final IGoogleSignInService _googleSigninService;
  final AuthService _authService;

  AuthRepository({
    required ILocalStorageService localStorageService,
    required IGoogleSignInService googleSigninService,
    required AuthService authService,
  }) : _localStorageService = localStorageService,
       _googleSigninService = googleSigninService,
       _authService = authService;

  @override
  Future<Result<bool>> isLoggedIn() async {
    final authToken = await _localStorageService.getAuthToken();

    return switch (authToken) {
      Success(:final value) => Success(value.isNotEmpty),
      Failure(:final error) => Success(false),
    };
  }

  @override
  Future<Result<Unit>> signIn() async {
    final result = await _googleSigninService.signIn();

    switch (result) {
      case Success(:final value):
        try {
          await _localStorageService.saveAuthToken(value);
          await _authService.auth();

          return successOfUnit();
        } on DioException catch (e, s) {
          log(
            'Failed to authenticate with backend after Google sign-in',
            name: 'AuthRepository',
            error: e,
            stackTrace: s,
          );

          return Failure(DataException(message: 'Erro ao autenticar com o backend após login com o Google'));
        }
      case Failure(:final error):
        log(
          'Failed to sign in with Google',
          name: 'AuthRepository',
          error: error,
        );

        return Failure(DataException(message: 'Erro ao realizar login com o Google'));
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    final result = await _googleSigninService.signOut();

    switch (result) {
      case Success():
        final clearAuthTokenResult = await _localStorageService.clearAuthToken();

        if (clearAuthTokenResult case Failure(:final error)) {
          log(
            'Failed to clear auth token from local storage',
            name: 'AuthRepository',
            error: error,
          );

          return Failure(error);
        }

        return successOfUnit();
      case Failure(:final error):
        log(
          'Failed to sign out from Google',
          name: 'AuthRepository',
          error: error,
        );

        return Failure(DataException(message: 'Erro ao realizar logout com o Google'));
    }
  }
}
