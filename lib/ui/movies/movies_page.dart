import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'movie_view_model.dart';
import 'widgets/genres_box.dart';
import 'widgets/movies_app_bar.dart';
import 'widgets/movies_by_category.dart';
import 'widgets/movies_by_gender.dart';
import 'widgets/movies_by_search.dart';

class MoviesPage extends ConsumerStatefulWidget {
  const MoviesPage({super.key});

  @override
  ConsumerState<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends ConsumerState<MoviesPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(movieViewModelProvider.notifier).fetchMoviesByCategory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final moviesViewModel = ref.watch(movieViewModelProvider);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        MoviesAppBar(),
        SliverToBoxAdapter(
          child: GenresBox(),
        ),
        SliverToBoxAdapter(
          child: switch (moviesViewModel) {
            MovieViewEnum.byCategory => MoviesByCategory(),
            MovieViewEnum.bySearch => MoviesBySearch(),
            MovieViewEnum.byGenre => MoviesByGender(),
          },
        ),
      ],
    );
  }
}
