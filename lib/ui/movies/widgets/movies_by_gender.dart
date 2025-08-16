import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commands/get_movies_by_genre_command.dart';
import 'movies_box.dart';

class MoviesByGender extends ConsumerWidget {
  const MoviesByGender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(getMoviesByGenreCommandProvider);

    return movies.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 96),
          child: MoviesBox(
            title: 'Filmes encontrados',
            movies: data,
            vertical: true,
          ),
        );
      },
      error: (error, stackTrace) => Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            'Erro ao buscar filmes por gênero.',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ),
      loading: () => Padding(
        padding: const EdgeInsets.all(20),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
