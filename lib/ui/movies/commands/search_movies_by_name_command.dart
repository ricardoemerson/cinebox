import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../domain/models/movie_model.dart';
import '../../../domain/usecases/usecases_providers.dart';

part 'search_movies_by_name_command.g.dart';

@riverpod
class SearchMoviesByNameCommand extends _$SearchMoviesByNameCommand {
  @override
  AsyncValue<List<MovieModel>> build() => AsyncLoading();

  Future<void> execute(String query) async {
    state = AsyncLoading();

    final searchMoviesByNameUsecase = ref.read(getMoviesByNameUsecaseProvider);
    final result = await searchMoviesByNameUsecase.execute(query: query);

    state = switch (result) {
      Success(value: final movies) => AsyncData(movies),
      Failure() => AsyncError(
        'Erro ao buscar filmes por nome',
        StackTrace.current,
      ),
    };
  }
}
