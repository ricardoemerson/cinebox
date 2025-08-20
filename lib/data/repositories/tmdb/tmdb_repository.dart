import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/result/result.dart';
import '../../../domain/models/cast_model.dart';
import '../../../domain/models/genre_model.dart';
import '../../../domain/models/movie_detail_model.dart';
import '../../../domain/models/movie_model.dart';
import '../../exceptions/data_exception.dart';
import '../../mappers/movie_mapper.dart';
import '../../services/tmdb/tmdb_service.dart';
import 'i_tmdb_repository.dart';

class TmdbRepository implements ITmdbRepository {
  final TmdbService _tmdbService;

  TmdbRepository({
    required TmdbService tmdbService,
  }) : _tmdbService = tmdbService;

  @override
  Future<Result<List<MovieModel>>> getPopularMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final movieResponse = await _tmdbService.getPopularMovies(language: language, page: page);

      return Success(MovieMapper.mapToMovies(movieResponse));
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes populares', error: e, stackTrace: s);

      return Failure(DataException(message: 'Erro ao buscar filmes populares'));
    }
  }

  @override
  Future<Result<List<MovieModel>>> discoverMovies({
    String language = 'pt-BR',
    int page = 1,
    String sortBy = 'popularity.desc',
    String? withGenres,
  }) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<Result<MovieDetailModel>> getMovieDetail({required int movieId}) async {
    try {
      final movieResponse = await _tmdbService.getMovieDetails(
        movieId: movieId,
        appendToResponse: 'credits,videos,images,recommendations,releases_dates',
      );

      final movieDetail = MovieDetailModel(
        title: movieResponse.title,
        overview: movieResponse.overview,
        releaseDate: movieResponse.releaseDate,
        runtime: movieResponse.runtime,
        voteAverage: movieResponse.voteAverage,
        voteCount: movieResponse.voteCount,
        images: movieResponse.images.backdrops
            .map((i) => 'https://image.tmdb.org/t/p/w342${i.filePath}')
            .toList(),
        cast: movieResponse.credits.cast
            .map(
              (c) => CastModel(
                name: c.name,
                character: c.character,
                profilePath: c.profilePath,
              ),
            )
            .toList(),
        genres: movieResponse.genres
            .map(
              (g) => GenreModel(
                id: g.id,
                name: g.name,
              ),
            )
            .toList(),
        videos: movieResponse.videos.results.map((v) => v.key).toList(),
      );

      return Success(movieDetail);
    } on DioException catch (e, s) {
      log('Erro ao buscar detalhes do filme', error: e, stackTrace: s);

      return Failure(DataException(message: 'Erro ao buscar detalhes do filme'));
    }
  }

  @override
  Future<Result<List<MovieModel>>> getNowPlayingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final movieResponse = await _tmdbService.getNowPlayingMovies(language: language, page: page);

      return Success(MovieMapper.mapToMovies(movieResponse));
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes atualmente nos cinemas', error: e, stackTrace: s);

      return Failure(DataException(message: 'Erro ao buscar filmes atualmente nos cinemas'));
    }
  }

  @override
  Future<Result<List<MovieModel>>> getTopRatedMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final movieResponse = await _tmdbService.getTopRatedMovies(language: language, page: page);

      return Success(MovieMapper.mapToMovies(movieResponse));
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes mais votados', error: e, stackTrace: s);

      return Failure(DataException(message: 'Erro ao buscar filmes mais votados'));
    }
  }

  @override
  Future<Result<List<MovieModel>>> getUpcomingMovies({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final movieResponse = await _tmdbService.getUpcomingMovies(language: language, page: page);

      return Success(MovieMapper.mapToMovies(movieResponse));
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes que estão por vir', error: e, stackTrace: s);

      return Failure(DataException(message: 'Erro ao buscar filmes que estão por vir'));
    }
  }

  @override
  Future<Result<List<MovieModel>>> searchMovies({
    required String query,
    String language = 'pt-BR',
    int page = 1,
  }) async {
    try {
      final movieResponse = await _tmdbService.searchMovies(query: query, language: language, page: page);

      return Success(MovieMapper.mapToMovies(movieResponse));
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes por nome', error: e, stackTrace: s);

      return Failure(DataException(message: 'Erro ao buscar filmes por nome'));
    }
  }

  @override
  Future<Result<List<GenreModel>>> getGenres() async {
    try {
      final data = await _tmdbService.getMoviesGenres();
      final genres = data.genres.map((g) => GenreModel(id: g.id, name: g.name)).toList();

      return Success(genres);
    } on DioException catch (e, s) {
      log('Erro ao buscar gêneros', error: e, stackTrace: s);

      return Failure(DataException(message: 'Erro ao buscar gêneros'));
    }
  }

  @override
  Future<Result<List<MovieModel>>> getMoviesByGenre({required int genreId}) async {
    try {
      final movieResponse = await _tmdbService.discoverMovies(withGenres: genreId.toString());

      return Success(MovieMapper.mapToMovies(movieResponse));
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes por gênero', error: e, stackTrace: s);

      return Future.value(Failure(DataException(message: 'Erro ao buscar filmes por gênero')));
    }
  }
}
