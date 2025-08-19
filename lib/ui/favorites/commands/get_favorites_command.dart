import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../data/repositories/repositories_providers.dart';
import '../../../domain/models/favorite_movie_model.dart';

part 'get_favorites_command.g.dart';

@riverpod
class GetFavoritesCommand extends _$GetFavoritesCommand {
  @override
  AsyncValue<List<FavoriteMovieModel>> build() => AsyncLoading();

  Future<void> execute() async {
    state = AsyncLoading();

    final movieRepository = ref.read(movieRepositoryProvider);
    final result = await movieRepository.getMyFavoritesMovies();

    state = switch (result) {
      Success(value: final movies) => AsyncData(movies),
      Failure() => AsyncError(
        'Erro ao buscar filmes favoritos',
        StackTrace.current,
      ),
    };
  }
}
