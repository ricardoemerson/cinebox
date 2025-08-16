import 'package:json_annotation/json_annotation.dart';

part 'movie_item_response.g.dart';

@JsonSerializable()
class MovieItemResponse {
  final int id;
  final String title;
  final String overview;
  final List<int>? genreIds;
  final String? posterPath;
  final String? backdropPath;
  final double voteAverage;
  final String? releaseDate;

  const MovieItemResponse({
    required this.id,
    required this.title,
    required this.overview,
    this.genreIds,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    this.releaseDate,
  });

  factory MovieItemResponse.fromJson(Map<String, dynamic> json) => _$MovieItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieItemResponseToJson(this);
}
