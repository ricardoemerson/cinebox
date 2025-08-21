import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../core/themes/text_styles.dart';

class MovieTrailer extends StatefulWidget {
  const MovieTrailer({super.key});

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  late YoutubePlayerController _controller;
  bool _isPlayerReady = false;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: 'dQw4w9WgXcQ', // Replace with your video ID
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Trailer',
          style: AppTextStyles.boldMedium,
        ),
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            clipBehavior: Clip.hardEdge,
            child: Visibility(
              visible: _isPlayerReady,
              replacement: Stack(
                alignment: Alignment.center,
                children: [
                  Image.network(
                    YoutubePlayer.getThumbnail(
                      videoId: _controller.initialVideoId,
                      quality: ThumbnailQuality.medium,
                    ),
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isPlayerReady = true;
                      });
                    },
                    icon: const Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
                  ),
                ],
              ),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.red,
                bottomActions: [
                  CurrentPosition(),
                  ProgressBar(isExpanded: true),
                  FullScreenButton(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
