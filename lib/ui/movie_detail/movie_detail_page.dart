import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../core/themes/colors.dart';
import '../core/themes/text_styles.dart';
import 'widgets/cast_box.dart';
import 'widgets/movie_trailer.dart';
import 'widgets/rating_panel.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes do Filme'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: CachedNetworkImage(
                      imageUrl:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2WH0Re2ye82m1WQdT2eQv_aV8UHCFGHEX-w&s',
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
                    'Luca',
                    style: AppTextStyles.titleLarge,
                  ),
                  RatingStars(
                    starCount: 5,
                    starColor: AppColors.yellow,
                    starSize: 14,
                    value: 3.5,
                    valueLabelVisibility: false,
                  ),
                  Text(
                    'Animação, Comédia, Aventura, Familia',
                    style: AppTextStyles.lightGreyRegular,
                  ),
                  Text('2021 (USA) | 1h 50m', style: AppTextStyles.regularSmall),
                  Text(
                    'Overview do filme de exemplo com muitas linhas de texto',
                    style: AppTextStyles.regularSmall,
                  ),
                  CastBox(),
                  MovieTrailer(),
                  const SizedBox(height: 30),
                  RatingPanel(voteAverage: 20, voteCount: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
