import 'package:flutter/material.dart';

import '../../core/widgets/movie_card.dart';

class MoviesBox extends StatelessWidget {
  final String title;

  const MoviesBox({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 32, bottom: 16),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 253,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: MovieCard(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
