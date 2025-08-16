import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movies_box.dart';

class MoviesByGender extends ConsumerStatefulWidget {
  const MoviesByGender({super.key});

  @override
  ConsumerState<MoviesByGender> createState() => _MoviesByGenderState();
}

class _MoviesByGenderState extends ConsumerState<MoviesByGender> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 96),
      child: MoviesBox(
        title: 'Filmes encontrados',
        movies: [],
        vertical: true,
      ),
    );
  }
}
