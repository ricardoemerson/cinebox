import '../../../core/result/result.dart';
import '../../../domain/models/genre_model.dart';
import '../../../domain/models/movie_model.dart';

abstract interface class ITmdbRepository {
  Future<Result<List<MovieModel>>> getPopularMovies({
    String language,
    int page,
  });

  Future<Result<List<MovieModel>>> getTopRatedMovies({
    String language,
    int page,
  });

  Future<Result<List<MovieModel>>> getUpcomingMovies({
    String language,
    int page,
  });

  Future<Result<List<MovieModel>>> getNowPlayingMovies({
    String language,
    int page,
  });

  Future<Result<List<MovieModel>>> searchMovies({
    required String query,
    String language,
    int page,
  });

  Future<Result<List<MovieModel>>> discoverMovies({
    String language,
    int page,
    String sortBy,
    String? withGenres,
  });

  Future<Result<MovieModel>> getMovieDetails({
    required int movieId,
    String language,
  });

  Future<Result<List<GenreModel>>> getGenres();

  Future<Result<List<MovieModel>>> getMoviesByGenre({
    required int genreId,
  });
}
