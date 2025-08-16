import 'package:json_annotation/json_annotation.dart';

part 'movie_item_model.g.dart';

@JsonSerializable()
class MovieItemModel {
  final int id;
  final String title;
  final String overview;
  final List<int>? genreIds;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String? releaseDate;

  const MovieItemModel({
    required this.id,
    required this.title,
    required this.overview,
    this.genreIds,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    this.releaseDate,
  });

  factory MovieItemModel.fromJson(Map<String, dynamic> json) => _$MovieItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieItemModelToJson(this);
}
