import '../../../core/result/result.dart';

abstract interface class IGoogleSignInService {
  Future<Result<String>> signIn();

  Future<Result<Unit>> signOut();

  Future<Result<String>> isSignedIn();
}
