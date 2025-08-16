import '../../core/result/result.dart';
import '../../data/repositories/tmdb/i_tmdb_repository.dart';
import '../models/movie_model.dart';

class GetMoviesByGenreUsecase {
  final ITmdbRepository _tmdbRepository;

  GetMoviesByGenreUsecase({
    required ITmdbRepository tmdbRepository,
  }) : _tmdbRepository = tmdbRepository;

  Future<Result<List<MovieModel>>> execute({
    required int genreId,
  }) async {
    final result = await _tmdbRepository.getMoviesByGenre(genreId: genreId);

    return switch (result) {
      Success(value: final movies) => Success(movies),
      Failure() => Failure(Exception('Erro ao buscar filmes por gênero')),
    };
  }
}
