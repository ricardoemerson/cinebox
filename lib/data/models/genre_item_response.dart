import 'package:json_annotation/json_annotation.dart';

part 'genre_item_response.g.dart';

@JsonSerializable()
class GenreItemResponse {
  final int id;
  final String name;

  GenreItemResponse({
    required this.id,
    required this.name,
  });

  factory GenreItemResponse.fromJson(Map<String, dynamic> json) => _$GenreItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GenreItemResponseToJson(this);
}
