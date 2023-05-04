import 'package:flutter/material.dart';
import 'package:photoplay/Features/favorites/presentation/widgets/favorite_item.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 20,
          itemBuilder: (context, index) {
            return const FavoriteItem();
          }),
    );
  }
}
