import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/result/result.dart';
import '../../../domain/models/favorite_movie_model.dart';
import '../../exceptions/data_exception.dart';
import '../../services/movies/movie_service.dart';
import 'i_movie_repository.dart';

class MovieRepository implements IMovieRepository {
  final MovieService _movieService;

  MovieRepository({
    required MovieService movieService,
  }) : _movieService = movieService;

  @override
  Future<Result<List<FavoriteMovieModel>>> getMyFavoritesMovies() async {
    try {
      final response = await _movieService.getMyFavoritesMovies();
      final favorites = response
          .map(
            (f) => FavoriteMovieModel(
              id: f.movieId,
              title: f.title,
              posterPath: f.posterUrl,
              year: f.year,
            ),
          )
          .toList();

      return Success(favorites);
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes favoritos', error: e, stackTrace: s);

      return Failure(DataException(message: 'Erro ao buscar filmes favoritos'));
    }
  }
}
