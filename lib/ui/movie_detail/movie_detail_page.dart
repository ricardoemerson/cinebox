import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/themes/colors.dart';
import '../core/themes/text_styles.dart';
import '../core/widgets/loader_and_message.dart';
import 'commands/get_movie_detail_command.dart';
import 'movie_detail_view_model.dart';
import 'widgets/cast_box.dart';
import 'widgets/movie_trailer.dart';
import 'widgets/rating_panel.dart';

class MovieDetailPage extends ConsumerStatefulWidget {
  const MovieDetailPage({super.key});

  @override
  ConsumerState<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends ConsumerState<MovieDetailPage> with LoaderAndMessage {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final movieId = ModalRoute.of(context)?.settings.arguments as int?;

      if (movieId == null) {
        showErrorSnackbar('ID do filme não encontrado.');
        Navigator.pop(context);
        return;
      }

      ref.read(movieDetailViewModelProvider).fetchMovieDetail(movieId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieDetail = ref.watch(getMovieDetailCommandProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
        centerTitle: true,
      ),
      body: movieDetail.when(
        data: (data) {
          if (data == null) {
            return Center(
              child: Text(
                'Detalhes do filme não encontrados.',
                style: AppTextStyles.boldMedium,
              ),
            );
          }

          final hoursRunTime = data.runtime ~/ 60;
          final minutesRunTime = data.runtime % 60;
          final runTime = '${hoursRunTime}h ${minutesRunTime}m';

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data.images.length,
                    itemBuilder: (context, index) {
                      final imageUrl = data.images[index];

                      return Padding(
                        padding: const EdgeInsets.all(2),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            width: 160,
                            color: AppColors.lightGrey,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    spacing: 8,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: AppTextStyles.titleLarge,
                      ),
                      RatingStars(
                        starCount: 5,
                        starColor: AppColors.yellow,
                        starSize: 14,
                        value: data.voteAverage / 2,
                        valueLabelVisibility: false,
                      ),
                      Text(
                        data.genres
                            .map(
                              (e) => e.name,
                            )
                            .join(', '),
                        style: AppTextStyles.lightGreyRegular,
                      ),
                      Text(
                        '${DateTime.parse(data.releaseDate).year} | $runTime',
                        style: AppTextStyles.regularSmall,
                      ),
                      Text(
                        data.overview,
                        style: AppTextStyles.regularSmall,
                      ),
                      CastBox(moveDetail: data),
                      if (data.videos.isNotEmpty) MovieTrailer(videoId: data.videos.first),
                      const SizedBox(height: 30),
                      RatingPanel(voteAverage: data.voteAverage, voteCount: data.voteCount),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              'Erro ao carregar detalhes do filme.',
              style: AppTextStyles.boldMedium,
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
