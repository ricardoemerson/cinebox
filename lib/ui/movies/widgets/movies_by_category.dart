import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/themes/colors.dart';
import '../commands/get_movies_by_category_command.dart';
import 'movies_box.dart';

class MoviesByCategory extends ConsumerWidget {
  const MoviesByCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(getMoviesByCategoryCommandProvider);

    return movies.when(
      data: (data) {
        if (data == null) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                'Nenhum filme encontrado.',
                style: const TextStyle(color: AppColors.red),
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 96),
          child: Column(
            children: [
              MoviesBox(title: 'Mais Populares', movies: data.popular),
              MoviesBox(title: 'Melhores Avaliados', movies: data.topRated),
              MoviesBox(title: 'Em Cartaz', movies: data.nowPlaying),
              MoviesBox(title: 'Em Breve', movies: data.upcoming),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            'Erro ao buscar filmes por categoria.',
            style: const TextStyle(color: AppColors.red),
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
