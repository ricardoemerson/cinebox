import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'commands/get_movies_by_category_command.dart';

part 'movie_view_model.g.dart';

enum MovieViewEnum {
  byCategory,
  bySearch,
  byGenre,
}

@riverpod
class MovieViewModel extends _$MovieViewModel {
  @override
  MovieViewEnum build() => MovieViewEnum.byCategory;

  Future<void> changeView(MovieViewEnum view) async {
    state = view;
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<void> fetchMoviesByCategory() async {
    await changeView(MovieViewEnum.byCategory);

    ref.read(getMoviesByCategoryCommandProvider.notifier).execute();
  }
}
