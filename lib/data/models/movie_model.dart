import 'package:json_annotation/json_annotation.dart';

import 'movie_item_model.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<MovieItemModel> results;

  MovieModel({
    required this.results,
    required this.page,
    required this.totalResults,
    required this.totalPages,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
