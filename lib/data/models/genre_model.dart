import 'package:json_annotation/json_annotation.dart';

import 'genre_item_model.dart';

part 'genre_model.g.dart';

@JsonSerializable()
class GenreModel {
  final List<GenreItemModel> genres;

  GenreModel({
    required this.genres,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) => _$GenreModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
