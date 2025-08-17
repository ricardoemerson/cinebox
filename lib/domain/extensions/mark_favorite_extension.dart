import '../models/movie_model.dart';

extension MarkFavoriteExtension on List<MovieModel> {
  List<MovieModel> markAsFavorite(List<int> favoriteIds) {
    return map((movie) {
      if (favoriteIds.contains(movie.id)) {
        return movie.copyWith(isFavorite: true);
      }
      return movie;
    }).toList();
  }
}
