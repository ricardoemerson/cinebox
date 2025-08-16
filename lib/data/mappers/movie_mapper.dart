import '../../domain/models/movie_model.dart';
import '../models/movie_response.dart';

class MovieMapper {
  static List<MovieModel> mapToMovies(MovieResponse movieResponse) {
    return movieResponse.results
        .map(
          (response) => MovieModel(
            id: response.id,
            title: response.title,
            overview: response.overview,
            genreIds: response.genreIds ?? [],
            voteAverage: response.voteAverage,
            posterPath: response.posterPath,
            backdropPath: response.backdropPath,
            releaseDate: response.releaseDate,
          ),
        )
        .toList();
  }
}
