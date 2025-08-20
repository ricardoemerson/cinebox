import 'cast_model.dart';
import 'genre_model.dart';

class MovieDetailModel {
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final int voteCount;
  final List<String> images;
  final List<CastModel> cast;
  final List<GenreModel> genres;
  final List<String> videos;

  MovieDetailModel({
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.voteCount,
    required this.images,
    required this.cast,
    required this.genres,
    required this.videos,
  });
}
