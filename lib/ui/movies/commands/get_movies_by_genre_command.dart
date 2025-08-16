import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../domain/models/movie_model.dart';
import '../../../domain/usecases/usecases_providers.dart';

part 'get_movies_by_genre_command.g.dart';

@riverpod
class GetMoviesByGenreCommand extends _$GetMoviesByGenreCommand {
  @override
  AsyncValue<List<MovieModel>> build() => AsyncLoading();

  Future<void> execute(int genreId) async {
    state = AsyncLoading();
    final genreUsecase = ref.read(getMoviesByGenreUsecaseProvider);
    final result = await genreUsecase.execute(genreId: genreId);

    state = switch (result) {
      Success(value: final movies) => AsyncData(movies),
      Failure() => AsyncError(
        'Erro ao buscar filmes por gênero',
        StackTrace.current,
      ),
    };
  }
}
