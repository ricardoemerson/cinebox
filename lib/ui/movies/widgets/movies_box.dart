import 'package:flutter/material.dart';

import '../../core/widgets/movie_card.dart';

class MoviesBox extends StatelessWidget {
  final String title;
  final bool vertical;

  const MoviesBox({
    super.key,
    required this.title,
    this.vertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 14, bottom: 8),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: vertical ? 0 : 20),
            child: Visibility(
              visible: !vertical,
              replacement: Center(
                child: Wrap(
                  spacing: 40,
                  runSpacing: 20,
                  runAlignment: WrapAlignment.center,
                  children: List.generate(
                    10,
                    (index) => Container(
                      width: 148,
                      height: 250,
                      child: MovieCard(),
                    ),
                  ),
                ),
              ),
              child: SizedBox(
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
            ),
          ),
        ],
      ),
    );
  }
}
