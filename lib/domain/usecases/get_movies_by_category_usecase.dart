import '../../core/result/result.dart';
import '../../data/repositories/movie/i_movie_repository.dart';
import '../../data/repositories/tmdb/i_tmdb_repository.dart';
import '../extensions/mark_favorite_extension.dart';
import '../models/favorite_movie_model.dart';
import '../models/movie_by_category_model.dart';
import '../models/movie_model.dart';

class GetMoviesByCategoryUsecase {
  final ITmdbRepository _tmdbRepository;
  final IMovieRepository _movieRepository;

  GetMoviesByCategoryUsecase({
    required ITmdbRepository tmdbRepository,
    required IMovieRepository movieRepository,
  }) : _tmdbRepository = tmdbRepository,
       _movieRepository = movieRepository;

  Future<Result<MovieByCategoryModel>> execute({
    String language = 'pt-BR',
    int page = 1,
  }) async {
    final results = await Future.wait([
      _movieRepository.getMyFavoritesMovies(),
      _tmdbRepository.getPopularMovies(language: language, page: page),
      _tmdbRepository.getTopRatedMovies(language: language, page: page),
      _tmdbRepository.getUpcomingMovies(language: language, page: page),
      _tmdbRepository.getNowPlayingMovies(language: language, page: page),
    ]);

    if (results case [
      Success<List<FavoriteMovieModel>>(value: final favorites),
      Success<List<MovieModel>>(value: final popular),
      Success<List<MovieModel>>(value: final topRated),
      Success<List<MovieModel>>(value: final upcoming),
      Success<List<MovieModel>>(value: final nowPlaying),
    ]) {
      final favoriteIds = favorites.map((e) => e.id).toList();

      return Success(
        MovieByCategoryModel(
          popular: popular.markAsFavorite(favoriteIds),
          topRated: topRated.markAsFavorite(favoriteIds),
          upcoming: upcoming.markAsFavorite(favoriteIds),
          nowPlaying: nowPlaying.markAsFavorite(favoriteIds),
        ),
      );
    }

    return Failure(Exception('Erro ao buscar filmes por categoria'));
  }
}
