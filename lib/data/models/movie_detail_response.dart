import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_response.g.dart';

@JsonSerializable()
class MovieDetailResponse {
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final int voteCount;
  final ImageResponse images;
  final CreditsResponse credits;
  final List<MovieDetailGenreItemResponse> genres;
  final VideoResponse videos;

  MovieDetailResponse({
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

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) => _$MovieDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailResponseToJson(this);
}

@JsonSerializable()
class CreditsResponse {
  final List<CastResponse> cast;

  CreditsResponse({
    required this.cast,
  });

  factory CreditsResponse.fromJson(Map<String, dynamic> json) => _$CreditsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreditsResponseToJson(this);
}

@JsonSerializable()
class ImageResponse {
  final List<MovieDetailBackdropResponse> backdrops;

  ImageResponse({
    required this.backdrops,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) => _$ImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}

@JsonSerializable()
class CastResponse {
  final String name;
  final String character;
  @JsonKey(defaultValue: '')
  final String profilePath;

  CastResponse({
    required this.name,
    required this.character,
    required this.profilePath,
  });

  factory CastResponse.fromJson(Map<String, dynamic> json) => _$CastResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CastResponseToJson(this);
}

@JsonSerializable()
class MovieDetailGenreItemResponse {
  final int id;
  final String name;

  MovieDetailGenreItemResponse({
    required this.id,
    required this.name,
  });

  factory MovieDetailGenreItemResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailGenreItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailGenreItemResponseToJson(this);
}

@JsonSerializable()
class MovieDetailBackdropResponse {
  final String filePath;

  MovieDetailBackdropResponse({
    required this.filePath,
  });

  factory MovieDetailBackdropResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailBackdropResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailBackdropResponseToJson(this);
}

@JsonSerializable()
class VideoResponse {
  final List<VideoItemResponse> results;

  VideoResponse({
    required this.results,
  });

  factory VideoResponse.fromJson(Map<String, dynamic> json) => _$VideoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoResponseToJson(this);
}

@JsonSerializable()
class VideoItemResponse {
  final String key;

  VideoItemResponse({
    required this.key,
  });

  factory VideoItemResponse.fromJson(Map<String, dynamic> json) => _$VideoItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VideoItemResponseToJson(this);
}
