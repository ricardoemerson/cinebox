import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/models/favorite_movie_model.dart';
import '../core/widgets/movie_card.dart';
import 'commands/get_favorites_command.dart';
import 'favorites_view_model.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoritesViewModelProvider).fetchFavorites();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesMovies = ref.watch(getFavoritesCommandProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Favoritos'),
        centerTitle: true,
      ),
      body: favoritesMovies.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (data) {
          if (data.isEmpty) {
            return const Center(child: Text('Nenhum filme favorito.'));
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 96, left: 8, right: 8),
            child: CustomScrollView(
              slivers: [
                SliverPadding(padding: const EdgeInsets.symmetric(horizontal: 16)),
                SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 148,
                    mainAxisExtent: 268,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final FavoriteMovieModel(:id, :title, :year, posterPath: imageUrl) = data[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        child: MovieCard(
                          key: UniqueKey(),
                          id: id,
                          title: title,
                          year: year.toString(),
                          imageUrl: imageUrl,
                          isFavorite: true,
                        ),
                      );
                    },
                    childCount: data.length,
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) => Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Text(
              'Erro ao buscar filmes favoritos.',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
