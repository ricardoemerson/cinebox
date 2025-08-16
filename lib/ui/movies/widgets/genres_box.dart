import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/themes/colors.dart';
import '../commands/get_genres_command.dart';
import '../movie_view_model.dart';

class GenresBox extends ConsumerStatefulWidget {
  const GenresBox({super.key});

  @override
  ConsumerState<GenresBox> createState() => _GenresBoxState();
}

class _GenresBoxState extends ConsumerState<GenresBox> {
  final selectedGenre = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    final genres = ref.watch(getGenresCommandProvider);

    return genres.when(
      data: (data) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
          child: SizedBox(
            height: 25,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return ValueListenableBuilder<int>(
                  valueListenable: selectedGenre,
                  builder: (_, value, _) {
                    final genre = data[index];

                    return Container(
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: value == genre.id ? AppColors.red : AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: InkWell(
                        onTap: () {
                          if (value == genre.id) {
                            selectedGenre.value = 0;
                            ref.read(movieViewModelProvider.notifier).fetchMoviesByCategory();

                            return;
                          }

                          selectedGenre.value = genre.id;
                          ref.read(movieViewModelProvider.notifier).fetchMoviesByGenre(genre.id);
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Center(
                            child: Text(
                              genre.name,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        );
      },
      error: (error, stackTrace) => Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Text(
            'Erro ao buscar gêneros.',
            style: const TextStyle(color: AppColors.red),
          ),
        ),
      ),
      loading: () => const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
