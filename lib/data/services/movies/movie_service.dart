import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/favorite_movie_response.dart';
import '../../models/save_favorite_movie_request.dart';

part 'movie_service.g.dart';

@RestApi()
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET('/favorite')
  Future<List<FavoriteMovieResponse>> getMyFavoritesMovies();

  @POST('/favorite')
  Future<void> addFavoriteMovie(
    @Body() SaveFavoriteMovieRequest saveFavoriteMovieRequest,
  );

  @DELETE('/favorite/{movieId}')
  Future<void> removeFavoriteMovie(@Path('movieId') int movieId);
}
