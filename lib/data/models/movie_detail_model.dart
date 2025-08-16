import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetailModel {
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final int voteCount;
  final ImageModel images;
  final CreditsModel credits;
  final List<MovieDetailGenreItemModel> genres;
  final VideoModel videos;

  MovieDetailModel({
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.voteAverage,
    required this.voteCount,
    required this.images,
    required this.credits,
    required this.genres,
    required this.videos,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) => _$MovieDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);
}

@JsonSerializable()
class CreditsModel {
  final List<CastModel> cast;

  CreditsModel({
    required this.cast,
  });

  factory CreditsModel.fromJson(Map<String, dynamic> json) => _$CreditsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsModelToJson(this);
}

@JsonSerializable()
class ImageModel {
  final List<MovieDetailBackdropModel> backdrops;

  ImageModel({
    required this.backdrops,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) => _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

@JsonSerializable()
class CastModel {
  final String name;
  final String character;
  @JsonKey(defaultValue: '')
  final String profilePath;

  CastModel({
    required this.name,
    required this.character,
    required this.profilePath,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) => _$CastModelFromJson(json);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);
}

@JsonSerializable()
class MovieDetailGenreItemModel {
  final int id;
  final String name;

  MovieDetailGenreItemModel({
    required this.id,
    required this.name,
  });

  factory MovieDetailGenreItemModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailGenreItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailGenreItemModelToJson(this);
}

@JsonSerializable()
class MovieDetailBackdropModel {
  final String filePath;

  MovieDetailBackdropModel({
    required this.filePath,
  });

  factory MovieDetailBackdropModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailBackdropModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailBackdropModelToJson(this);
}

@JsonSerializable()
class VideoModel {
  final List<VideoItemModel> results;

  VideoModel({
    required this.results,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}

@JsonSerializable()
class VideoItemModel {
  final String key;

  VideoItemModel({
    required this.key,
  });

  factory VideoItemModel.fromJson(Map<String, dynamic> json) => _$VideoItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoItemModelToJson(this);
}
