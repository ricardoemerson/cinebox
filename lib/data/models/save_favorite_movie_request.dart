import 'package:json_annotation/json_annotation.dart';

part 'save_favorite_movie_request.g.dart';

@JsonSerializable()
class SaveFavoriteMovieRequest {
  final int movieId;
  final String title;
  final String posterUrl;
  final int year;

  SaveFavoriteMovieRequest({
    required this.movieId,
    required this.title,
    required this.posterUrl,
    required this.year,
  });

  factory SaveFavoriteMovieRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveFavoriteMovieRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SaveFavoriteMovieRequestToJson(this);
}
