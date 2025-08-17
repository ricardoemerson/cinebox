import 'package:flutter/material.dart';

import '../../../domain/models/movie_model.dart';
import '../../core/widgets/movie_card.dart';

class MoviesBox extends StatelessWidget {
  final String title;
  final List<MovieModel> movies;
  final bool vertical;

  const MoviesBox({
    super.key,
    required this.title,
    required this.movies,
    this.vertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14, bottom: 8),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: vertical ? 0 : 20),
            child: Visibility(
              visible: !vertical,
              replacement: Center(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 20,
                  runAlignment: WrapAlignment.center,
                  children: [
                    for (final movie in movies)
                      MovieCard(
                        id: movie.id,
                        title: movie.title,
                        year: (movie.releaseDate != null && movie.releaseDate!.isNotEmpty)
                            ? movie.releaseDate!.substring(0, 4)
                            : '',
                        imageUrl: 'https://images.tmdb.org/t/p/w154${movie.posterPath}',
                        isFavorite: movie.isFavorite,
                        onFavoritePressed: () {}, // Replace with actual favorite logic
                      ),
                  ],
                ),
              ),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: 253,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    final movie = movies[index];

                    return Container(
                      margin: const EdgeInsets.only(right: 16),
                      child: MovieCard(
                        id: movie.id,
                        title: movie.title,
                        year: (movie.releaseDate != null && movie.releaseDate!.isNotEmpty)
                            ? movie.releaseDate!.substring(0, 4)
                            : '',
                        imageUrl: 'https://images.tmdb.org/t/p/w154${movie.posterPath}',
                        isFavorite: movie.isFavorite,
                        onFavoritePressed: () {}, // Replace with actual favorite logic
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
