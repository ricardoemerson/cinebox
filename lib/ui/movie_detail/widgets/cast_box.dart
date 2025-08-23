import 'package:flutter/material.dart';

import '../../../domain/models/movie_detail_model.dart';
import '../../core/themes/colors.dart';
import '../../core/themes/text_styles.dart';
import 'actor_card.dart';

class CastBox extends StatelessWidget {
  final MovieDetailModel moveDetail;

  const CastBox({
    super.key,
    required this.moveDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: AppColors.lightGrey.withAlpha(25)),
      child: ExpansionTile(
        dense: true,
        tilePadding: EdgeInsets.zero,
        childrenPadding: const EdgeInsets.symmetric(vertical: 10),
        title: Text('Elenco', style: AppTextStyles.regularSmall),
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: moveDetail.cast.length,
              itemBuilder: (context, index) {
                final actor = moveDetail.cast[index];

                return ActorCard(
                  name: actor.name,
                  character: actor.character,
                  imageUrl: 'https://image.tmdb.org/t/p/w185/${actor.profilePath}',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
