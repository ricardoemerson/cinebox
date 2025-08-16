import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../domain/models/movie_by_category_model.dart';
import '../../../domain/usecases/usecases_providers.dart';

part 'get_movies_by_category_command.g.dart';

@riverpod
class GetMoviesByCategoryCommand extends _$GetMoviesByCategoryCommand {
  @override
  AsyncValue<MovieByCategoryModel?> build() => AsyncData(null);

  Future<void> execute() async {
    state = AsyncLoading();

    final getMoviesByCategoryUsecase = ref.read(getMoviesByCategoryUsecaseProvider);
    final result = await getMoviesByCategoryUsecase.execute();

    state = switch (result) {
      Success(value: final moviesByCategory) => AsyncData(moviesByCategory),
      Failure() => AsyncError(
        'Erro ao buscar filmes por categoria',
        StackTrace.current,
      ),
    };
  }
}
