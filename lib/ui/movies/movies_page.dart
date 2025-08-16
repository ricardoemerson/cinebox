import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/genres_box.dart';
import 'widgets/movies_app_bar.dart';
import 'widgets/movies_by_category.dart';

class MoviesPage extends ConsumerStatefulWidget {
  const MoviesPage({super.key});

  @override
  ConsumerState<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends ConsumerState<MoviesPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        MoviesAppBar(),
        SliverToBoxAdapter(
          child: GenresBox(),
        ),
        SliverToBoxAdapter(
          child: MoviesByCategory(),
        ),
      ],
    );
  }
}
