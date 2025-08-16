import 'package:json_annotation/json_annotation.dart';

import 'genre_item_response.dart';

part 'genre_response.g.dart';

@JsonSerializable()
class GenreResponse {
  final List<GenreItemResponse> genres;

  GenreResponse({
    required this.genres,
  });

  factory GenreResponse.fromJson(Map<String, dynamic> json) => _$GenreResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreResponseToJson(this);
}
