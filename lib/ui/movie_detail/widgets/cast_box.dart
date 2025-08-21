import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';
import '../../core/themes/text_styles.dart';
import 'actor_card.dart';

class CastBox extends StatelessWidget {
  const CastBox({super.key});

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
              itemCount: 10,
              itemBuilder: (context, index) {
                return ActorCard(
                  name: 'Actor $index',
                  character: 'Character $index',
                  imageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2WH0Re2ye82m1WQdT2eQv_aV8UHCFGHEX-w&s',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
