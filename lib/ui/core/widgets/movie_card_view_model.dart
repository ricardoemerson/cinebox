import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../commands/remove_favorite_movie_command.dart';
import '../commands/save_favorite_movie_command.dart';

part 'movie_card_view_model.g.dart';

@riverpod
class MovieCardViewModel extends _$MovieCardViewModel {
  @override
  void build(Key key, int movieId) {}

  void toggleFavorite({
    required int id,
    required String title,
    required String posterPath,
    required int year,
    required bool isFavorite,
  }) {
    if (isFavorite) {
      ref
          .read(saveFavoriteMovieCommandProvider(key, id).notifier)
          .execute(
            id: id,
            title: title,
            posterPath: posterPath,
            year: year,
          );
    } else {
      ref.read(removeFavoriteMovieCommandProvider(key, movieId).notifier).execute();
    }
  }
}
