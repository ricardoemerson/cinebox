import '../../../core/result/result.dart';

abstract interface class IAuthRepository {
  Future<Result<Unit>> signIn();

  Future<Result<Unit>> signOut();

  Future<Result<bool>> isLoggedIn();
}
