import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

import '../../../core/result/result.dart';
import 'i_google_sign_in_service.dart';

class GoogleSignInService implements IGoogleSignInService {
  @override
  Future<Result<String>> isSignedIn() async {
    try {
      final loggedIn = await GoogleSignIn.instance.attemptLightweightAuthentication();

      if (loggedIn case GoogleSignInAccount(authentication: GoogleSignInAuthentication(:final idToken?))) {
        return Success(idToken);
      } else {
        return Failure(Exception('User is not signed in with Google'));
      }
    } catch (e, s) {
      log(
        'Failed to check if user is signed in with Google',
        name: 'GoogleSigninService',
        error: e,
        stackTrace: s,
      );

      return Failure(Exception('Failed to check if user is signed in with Google'));
    }
  }

  @override
  Future<Result<String>> signIn() async {
    try {
      final auth = await GoogleSignIn.instance.authenticate(scopeHint: ['email', 'profile', 'openid']);

      if (auth.authentication case GoogleSignInAuthentication(idToken: final idToken?)) {
        return Success(idToken);
      } else {
        return Failure(Exception('Failed to sign in with Google'));
      }
    } catch (e, s) {
      log(
        'Failed to sign in with Google',
        name: 'GoogleSigninService',
        error: e,
        stackTrace: s,
      );

      return Failure(Exception('Failed to sign in with Google'));
    }
  }

  @override
  Future<Result<Unit>> signOut() async {
    try {
      await GoogleSignIn.instance.signOut();
      return successOfUnit();
    } catch (e, s) {
      log(
        'Failed to sign out from Google',
        name: 'GoogleSigninService',
        error: e,
        stackTrace: s,
      );

      return Failure(Exception('Failed to sign out from Google'));
    }
  }
}
