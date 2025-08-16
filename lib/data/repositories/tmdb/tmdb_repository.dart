import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/result/result.dart';
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

      return Failure(
        DataException(
          message: 'Erro ao buscar filmes populares',
        ),
      );
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
  Future<Result<MovieModel>> getMovieDetails({
    required int movieId,
    String language = 'pt-BR',
  }) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
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

      return Failure(
        DataException(
          message: 'Erro ao buscar filmes atualmente nos cinemas',
        ),
      );
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

      return Failure(
        DataException(
          message: 'Erro ao buscar filmes mais votados',
        ),
      );
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

      return Failure(
        DataException(
          message: 'Erro ao buscar filmes que estão por vir',
        ),
      );
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

      return Success(MovieMapper.mapToMovies(movieResponse as dynamic));
    } on DioException catch (e, s) {
      log('Erro ao buscar filmes', error: e, stackTrace: s);

      return Failure(
        DataException(
          message: 'Erro ao buscar filmes',
        ),
      );
    }
  }
}
