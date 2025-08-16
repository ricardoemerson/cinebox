import 'movie_model.dart';

class MovieByCategoryModel {
  final List<MovieModel> popular;
  final List<MovieModel> topRated;
  final List<MovieModel> upcoming;
  final List<MovieModel> nowPlaying;

  MovieByCategoryModel({
    required this.popular,
    required this.topRated,
    required this.upcoming,
    required this.nowPlaying,
  });
}
