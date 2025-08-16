import 'package:json_annotation/json_annotation.dart';

part 'genre_item_model.g.dart';

@JsonSerializable()
class GenreItemModel {
  final int id;
  final String name;

  GenreItemModel({
    required this.id,
    required this.name,
  });

  factory GenreItemModel.fromJson(Map<String, dynamic> json) => _$GenreItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$GenreItemModelToJson(this);
}
