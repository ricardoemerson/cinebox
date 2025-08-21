import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../commands/favorite_movie_command.dart';
import '../commands/remove_favorite_movie_command.dart';
import '../commands/save_favorite_movie_command.dart';
import '../themes/colors.dart';
import 'loader_and_message.dart';
import 'movie_card_view_model.dart';

class MovieCard extends ConsumerStatefulWidget {
  final int id;
  final String title;
  final String year;
  final String imageUrl;
  final bool isFavorite;
  final VoidCallback? onFavoritePressed;

  const MovieCard({
    super.key,
    required this.id,
    required this.title,
    required this.year,
    required this.imageUrl,
    this.isFavorite = false,
    this.onFavoritePressed,
  });

  @override
  ConsumerState<MovieCard> createState() => _MovieCardState();
}

class _MovieCardState extends ConsumerState<MovieCard> with LoaderAndMessage {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(favoriteMovieCommandProvider(widget.id).notifier).setFavorite(widget.isFavorite);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = ref.watch(favoriteMovieCommandProvider(widget.id));

    ref.listen(saveFavoriteMovieCommandProvider(widget.key!, widget.id), (_, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          showErrorSnackbar('Desculpe, não foi possível favoritar o filme.');
        },
      );
    });

    ref.listen(removeFavoriteMovieCommandProvider(widget.key!, widget.id), (_, next) {
      next.whenOrNull(
        error: (error, stackTrace) {
          showErrorSnackbar('Desculpe, não foi possível desfavoritar o filme.');
        },
      );
    });

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('/movie-detail', arguments: widget.id);
      },
      child: Stack(
        children: [
          SizedBox(
            width: 148,
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 148,
                      height: 184,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  width: 148,
                  height: 184,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 48,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.year,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.lightGrey,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 50,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(30),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed:
                      widget.onFavoritePressed ??
                      () {
                        ref
                            .read(movieCardViewModelProvider(widget.key!, widget.id).notifier)
                            .toggleFavorite(
                              id: widget.id,
                              title: widget.title,
                              posterPath: widget.imageUrl,
                              year: int.parse(widget.year),
                              isFavorite: !isFavorite,
                            );
                      },
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? AppColors.red : AppColors.darkGrey,
                    size: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
