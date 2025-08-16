import 'package:json_annotation/json_annotation.dart';

import 'movie_item_response.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse {
  final int page;
  final int? totalResults;
  final int? totalPages;
  final List<MovieItemResponse> results;

  MovieResponse({
    required this.results,
    required this.page,
    this.totalResults,
    this.totalPages,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) => _$MovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
