import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/movie/i_movie_repository.dart';
import '../../data/repositories/repositories_providers.dart';
import 'commands/get_favorites_command.dart';

part 'favorites_view_model.g.dart';

class FavoritesViewModel {
  final GetFavoritesCommand _getFavoritesCommand;
  final IMovieRepository _movieRepository;

  FavoritesViewModel({
    required GetFavoritesCommand getFavoritesCommand,
    required IMovieRepository movieRepository,
  }) : _getFavoritesCommand = getFavoritesCommand,
       _movieRepository = movieRepository;

  Future<void> fetchFavorites() async => _getFavoritesCommand.execute();

  Future<void> removeFavoriteMovie(int movieId) async {
    await _movieRepository.removeFavoriteMovie(movieId);
    fetchFavorites();
  }
}

@riverpod
FavoritesViewModel favoritesViewModel(Ref ref) {
  return FavoritesViewModel(
    getFavoritesCommand: ref.read(getFavoritesCommandProvider.notifier),
    movieRepository: ref.read(movieRepositoryProvider),
  );
}
