import '../../core/result/result.dart';
import '../../data/repositories/movie/i_movie_repository.dart';
import '../../data/repositories/tmdb/i_tmdb_repository.dart';
import '../extensions/mark_favorite_extension.dart';
import '../models/favorite_movie_model.dart';
import '../models/movie_model.dart';

class GetMoviesByNameUsecase {
  final ITmdbRepository _tmdbRepository;
  final IMovieRepository _movieRepository;

  GetMoviesByNameUsecase({
    required ITmdbRepository tmdbRepository,
    required IMovieRepository movieRepository,
  }) : _tmdbRepository = tmdbRepository,
       _movieRepository = movieRepository;

  Future<Result<List<MovieModel>>> execute({required String query}) async {
    final results = await Future.wait([
      _movieRepository.getMyFavoritesMovies(),
      _tmdbRepository.searchMovies(query: query),
    ]);

    if (results case [
      Success<List<FavoriteMovieModel>>(value: final favorites),
      Success<List<MovieModel>>(value: final searchMovies),
    ]) {
      final favoriteIds = favorites.map((e) => e.id).toList();
      return Success(searchMovies.markAsFavorite(favoriteIds));
    }

    return Failure(Exception('Erro ao buscar filmes por nome'));
  }
}
