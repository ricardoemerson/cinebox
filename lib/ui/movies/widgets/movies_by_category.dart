import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_box.dart';

class MoviesByCategory extends ConsumerStatefulWidget {
  const MoviesByCategory({super.key});

  @override
  ConsumerState<MoviesByCategory> createState() => _MoviesByCategoryState();
}

class _MoviesByCategoryState extends ConsumerState<MoviesByCategory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80),
      child: Column(
        children: [
          MoviesBox(title: 'Mais populares'),
          MoviesBox(title: 'Em alta'),
          MoviesBox(title: 'Lançamentos'),
          MoviesBox(title: 'Top filmes'),
        ],
      ),
    );
  }
}
