import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'commands/get_movie_detail_command.dart';

part 'movie_detail_view_model.g.dart';

class MovieDetailViewModel {
  final GetMovieDetailCommand _getMovieDetailCommand;

  MovieDetailViewModel({
    required GetMovieDetailCommand getMovieDetailCommand,
  }) : _getMovieDetailCommand = getMovieDetailCommand;

  Future<void> fetchMovieDetail(int movieId) async {
    await _getMovieDetailCommand.execute(movieId);
  }
}

@riverpod
MovieDetailViewModel movieDetailViewModel(Ref ref) {
  return MovieDetailViewModel(
    getMovieDetailCommand: ref.read(getMovieDetailCommandProvider.notifier),
  );
}
