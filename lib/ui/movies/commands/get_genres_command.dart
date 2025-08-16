import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../data/repositories/repositories_providers.dart';
import '../../../domain/models/genre_model.dart';

part 'get_genres_command.g.dart';

@riverpod
class GetGenresCommand extends _$GetGenresCommand {
  @override
  Future<List<GenreModel>> build() async {
    final result = await ref.read(tmdbRepositoryProvider).getGenres();

    return switch (result) {
      Success(value: final genres) => genres,
      Failure() => [],
    };
  }
}
