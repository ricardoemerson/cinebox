import '../../core/result/result.dart';
import '../../data/repositories/tmdb/i_tmdb_repository.dart';
import '../models/movie_model.dart';

class GetMoviesByNameUsecase {
  final ITmdbRepository _tmdbRepository;

  GetMoviesByNameUsecase({
    required ITmdbRepository tmdbRepository,
  }) : _tmdbRepository = tmdbRepository;

  Future<Result<List<MovieModel>>> execute({required String query}) async {
    final result = await _tmdbRepository.searchMovies(query: query);

    return switch (result) {
      Success(value: final movies) => Success(movies),
      Failure() => Failure(Exception('Erro ao buscar filmes por nome')),
    };
  }
}
