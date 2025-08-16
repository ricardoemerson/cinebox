import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/genre_model.dart';
import '../../models/movie_detail_model.dart';
import '../../models/movie_model.dart';

part 'tmdb_service.g.dart';

@RestApi()
abstract class TmdbService {
  factory TmdbService(Dio dio, {String baseUrl}) = _TmdbService;

  @GET('/genre/movie/list')
  Future<GenreModel> getMoviesGenres({
    @Query('language') String language = 'pt-BR',
  });

  @GET('/movie/popular')
  Future<MovieModel> getPopularMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/movie/top_rated')
  Future<MovieModel> getTopRatedMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/movie/upcoming')
  Future<MovieModel> getUpcomingMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/movie/now_playing')
  Future<MovieModel> getNowPlayingMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  @GET('/search/movie')
  Future<MovieModel> searchMovies({
    @Query('query') required String query,
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
  });

  // gere o discover movie
  @GET('/discover/movie')
  Future<MovieModel> discoverMovies({
    @Query('language') String language = 'pt-BR',
    @Query('page') int page = 1,
    @Query('sort_by') String sortBy = 'popularity.desc',
    @Query('with_genres') String? withGenres,
  });

  @GET('/movie/{movieId}?include_image_language=pt,null')
  Future<MovieDetailModel> getMovieDetails({
    @Path('movieId') required int movieId,
    @Query('language') String language = 'pt-BR',
    @Query('append_to_response') String appendToResponse = '',
  });
}
