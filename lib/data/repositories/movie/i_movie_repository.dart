import '../../../core/result/result.dart';
import '../../../domain/models/favorite_movie_model.dart';

abstract interface class IMovieRepository {
  Future<Result<List<FavoriteMovieModel>>> getMyFavoritesMovies();
}
