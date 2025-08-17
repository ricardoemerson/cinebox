import 'package:json_annotation/json_annotation.dart';

part 'favorite_movie_response.g.dart';

@JsonSerializable()
class FavoriteMovieResponse {
  final int movieId;
  final String title;
  final String posterUrl;
  final int year;

  FavoriteMovieResponse({
    required this.movieId,
    required this.title,
    required this.posterUrl,
    required this.year,
  });

  factory FavoriteMovieResponse.fromJson(Map<String, dynamic> json) => _$FavoriteMovieResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteMovieResponseToJson(this);
}
