import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/favorites/presentation/manager/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/core/functions/show_custom_snack_bar.dart';

class FavoritesBtn extends StatelessWidget {
  const FavoritesBtn({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    FavoritesCubit favoritesCubit = BlocProvider.of<FavoritesCubit>(context);
    return MaterialButton(
      color: Colors.white.withOpacity(0.15),
      onPressed: () {
        favoritesCubit.addToFavorites(favoriteItem: movie.toMap());
      },
      child: BlocConsumer<FavoritesCubit, FavoritesStates>(
        listener: (context, state) {
          if (state is AddToFavoritesFailureState) {
            showCustomSnackBar(
              context: context,
              content: state.errMessage,
              backgroundColor: Colors.red,
            );
          }
        },
        builder: (context, state) {
          if (state is AddToFavoritesLoadingState) {
            return const FavoritesBtnLoading();
          } else if (state is AddToFavoritesSuccessState) {
            return const FavoritesBtnChild(
              isInFavorites: true,
            );
          }
          return favoritesCubit.favorites
                  .where((e) => e.id == movie.id)
                  .isNotEmpty
              ? const FavoritesBtnChild(isInFavorites: true)
              : const FavoritesBtnChild(isInFavorites: false);
        },
      ),
    );
  }
}

class FavoritesBtnLoading extends StatelessWidget {
  const FavoritesBtnLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
      height: 20,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}

class FavoritesBtnChild extends StatelessWidget {
  const FavoritesBtnChild({
    super.key,
    required this.isInFavorites,
  });
  final bool isInFavorites;
  @override
  Widget build(BuildContext context) {
    return isInFavorites
        ? Image.asset(
            'assets/images/heart_minus.png',
            width: 25,
            height: 25,
            color: Colors.red,
          )
        : Image.asset(
            'assets/images/heart_plus.png',
            width: 25,
            height: 25,
            color: Colors.white,
          );
  }
}
