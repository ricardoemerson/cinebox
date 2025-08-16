import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_box.dart';

class MoviesBySearch extends ConsumerStatefulWidget {
  const MoviesBySearch({super.key});

  @override
  ConsumerState<MoviesBySearch> createState() => _MoviesBySearchState();
}

class _MoviesBySearchState extends ConsumerState<MoviesBySearch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 96),
      child: MoviesBox(
        title: 'Filmes encontrados',
        vertical: true,
      ),
    );
  }
}
