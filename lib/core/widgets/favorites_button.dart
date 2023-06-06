import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/favorites/presentation/manager/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
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
    return BlocConsumer<FavoritesCubit, FavoritesStates>(
      listener: (context, state) {
        if (state is AddOrRemoveFavoritesFailureState) {
          showCustomSnackBar(
            context: context,
            content: state.errMessage,
            backgroundColor: Colors.red,
          );
        }
        if (state is RemoveFavoriteSuccessState) {
          favoritesCubit.getFavorites().then((value) {
            showCustomSnackBar(
              context: context,
              content: state.success,
              backgroundColor: kPrimatyColor,
              textColor: Colors.black,
            );
          });
        }
        if (state is AddToFavoritesSuccessState) {
          favoritesCubit.getFavorites().then((value) {
            showCustomSnackBar(
              context: context,
              content: state.success,
              backgroundColor: kPrimatyColor,
              textColor: Colors.black,
            );
          });
        }
      },
      builder: (context, state) {
        if (state is GetFavoritesSuccessState) {
          return MaterialButton(
            color: Colors.white.withOpacity(0.3),
            onPressed: () {
              if (favoritesCubit.isFaved(id: movie.id)) {
                favoritesCubit.removeFavorite(id: movie.id);
              } else {
                favoritesCubit.addToFavorites(favoriteItem: movie.toMap());
              }
            },
            child: FavoritesBtnChild(
                isFaved: favoritesCubit.isFaved(id: movie.id)),
          );
        }
        return const MaterialButton(
          onPressed: null,
          child: SizedBox(
            height: 25,
            width: 25,
            child: Center(
                child: CircularProgressIndicator(
              color: kPrimatyColor,
            )),
          ),
        );
      },
    );
  }
}

class FavoritesBtnChild extends StatelessWidget {
  const FavoritesBtnChild({
    super.key,
    required this.isFaved,
  });
  final bool isFaved;
  @override
  Widget build(BuildContext context) {
    return isFaved
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
            color: BlocProvider.of<ThemeCubit>(context).isDarkTheme
                ? Colors.white
                : Colors.black,
          );
  }
}
