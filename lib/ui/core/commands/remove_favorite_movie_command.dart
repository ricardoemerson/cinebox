import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/result/result.dart';
import '../../../data/repositories/repositories_providers.dart';
import 'favorite_movie_command.dart';

part 'remove_favorite_movie_command.g.dart';

@riverpod
class RemoveFavoriteMovieCommand extends _$RemoveFavoriteMovieCommand {
  @override
  AsyncValue<int> build(Key key, int movieId) => AsyncData(movieId);

  Future<void> execute() async {
    final favoriteMovieCommand = ref.read(favoriteMovieCommandProvider(movieId).notifier)..setFavorite(false);

    final movieRepository = ref.read(movieRepositoryProvider);
    final result = await movieRepository.removeFavoriteMovie(movieId);

    switch (result) {
      case Success():
        log('Filme removido com sucesso: $movieId');
      case Failure(:final error):
        favoriteMovieCommand.setFavorite(true);
        state = AsyncError(error, StackTrace.current);
    }
  }
}
