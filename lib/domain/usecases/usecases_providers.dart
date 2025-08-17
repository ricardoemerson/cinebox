import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/repositories_providers.dart';
import 'get_movies_by_category_usecase.dart';
import 'get_movies_by_genre_usecase.dart';
import 'get_movies_by_name_usecase.dart';

part 'usecases_providers.g.dart';

@riverpod
GetMoviesByCategoryUsecase getMoviesByCategoryUsecase(Ref ref) {
  return GetMoviesByCategoryUsecase(
    tmdbRepository: ref.watch(tmdbRepositoryProvider),
  );
}

@riverpod
GetMoviesByGenreUsecase getMoviesByGenreUsecase(Ref ref) {
  return GetMoviesByGenreUsecase(
    tmdbRepository: ref.watch(tmdbRepositoryProvider),
  );
}

@riverpod
GetMoviesByNameUsecase getMoviesByNameUsecase(Ref ref) {
  return GetMoviesByNameUsecase(
    tmdbRepository: ref.watch(tmdbRepositoryProvider),
  );
}
