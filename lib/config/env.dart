import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied()
abstract class Env {
  @EnviedField(varName: 'GOOGLE_API_KEY', obfuscate: true)
  static final String googleApiKey = _Env.googleApiKey;

  @EnviedField(varName: 'BACKEND_URL')
  static final String backendUrl = _Env.backendUrl;

  @EnviedField(varName: 'THE_MOVIE_DB_API_KEY', obfuscate: true)
  static final String theMovieDbApiKey = _Env.theMovieDbApiKey;
}
