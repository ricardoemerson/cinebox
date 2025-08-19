import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../data/repositories/repositories_providers.dart';
import '../../../domain/models/favorite_movie_model.dart';
import 'favorite_movie_command.dart';

part 'save_favorite_movie_command.g.dart';

@riverpod
class SaveFavoriteMovieCommand extends _$SaveFavoriteMovieCommand {
  @override
  AsyncValue<int> build(Key key, int movieId) => AsyncData(movieId);

  Future<void> execute({
    required int id,
    required String title,
    required String posterPath,
    required int year,
  }) async {
    final favoriteMovieCommand = ref.read(favoriteMovieCommandProvider(id).notifier)..setFavorite(true);

    final movieRepository = ref.read(movieRepositoryProvider);
    final result = await movieRepository.addFavoriteMovie(
      FavoriteMovieModel(
        id: id,
        title: title,
        posterPath: posterPath,
        year: year,
      ),
    );

    switch (result) {
      case Success():
        log('Filme favoritado com sucesso: $movieId');
      case Failure(:final error):
        favoriteMovieCommand.setFavorite(false);
        state = AsyncError(error, StackTrace.current);
    }
  }
}
