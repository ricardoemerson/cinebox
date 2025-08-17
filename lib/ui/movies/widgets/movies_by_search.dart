import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commands/search_movies_by_name_command.dart';
import 'movies_box.dart';

class MoviesBySearch extends ConsumerStatefulWidget {
  const MoviesBySearch({super.key});

  @override
  ConsumerState<MoviesBySearch> createState() => _MoviesBySearchState();
}

class _MoviesBySearchState extends ConsumerState<MoviesBySearch> {
  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(searchMoviesByNameCommandProvider);

    return movies.when(
      data: (data) {
        if (data.isEmpty) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Nenhum filme encontrado.',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }

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
            'Erro ao buscar filmes por nome.',
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
