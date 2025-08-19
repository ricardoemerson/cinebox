import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'commands/get_favorites_command.dart';

part 'favorites_view_model.g.dart';

class FavoritesViewModel {
  final GetFavoritesCommand _getFavoritesCommand;

  FavoritesViewModel({
    required GetFavoritesCommand getFavoritesCommand,
  }) : _getFavoritesCommand = getFavoritesCommand;

  Future<void> fetchFavorites() async => _getFavoritesCommand.execute();
}

@riverpod
FavoritesViewModel favoritesViewModel(Ref ref) {
  return FavoritesViewModel(getFavoritesCommand: ref.read(getFavoritesCommandProvider.notifier));
}
