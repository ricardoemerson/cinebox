import '../../core/result/result.dart';
import '../../data/repositories/tmdb/i_tmdb_repository.dart';
import '../models/Movie_model.dart';
import '../models/movie_by_category_model.dart';

class GetMoviesByCategoryUsecase {
  final ITmdbRepository _tmdbRepository;

  GetMoviesByCategoryUsecase({
    required ITmdbRepository tmdbRepository,
  }) : _tmdbRepository = tmdbRepository;

  Future<Result<MovieByCategoryModel>> execute({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    final results = await Future.wait([
      _tmdbRepository.getPopularMovies(language: language, page: page),
      _tmdbRepository.getTopRatedMovies(language: language, page: page),
      _tmdbRepository.getUpcomingMovies(language: language, page: page),
      _tmdbRepository.getNowPlayingMovies(language: language, page: page),
    ]);

    if (results case [
      Success<List<MovieModel>>(value: final popular),
      Success<List<MovieModel>>(value: final topRated),
      Success<List<MovieModel>>(value: final upcoming),
      Success<List<MovieModel>>(value: final nowPlaying),
    ]) {
      return Success(
        MovieByCategoryModel(
          popular: popular,
          topRated: topRated,
          upcoming: upcoming,
          nowPlaying: nowPlaying,
        ),
      );
    }

    return Failure(Exception('Erro ao buscar filmes por categoria'));
  }
}
