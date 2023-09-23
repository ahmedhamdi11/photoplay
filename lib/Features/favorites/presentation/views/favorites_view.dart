import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/favorites/presentation/manager/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:photoplay/Features/favorites/presentation/widgets/favorite_item.dart';
import 'package:photoplay/core/widgets/error_view.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void initState() {
    BlocProvider.of<FavoritesCubit>(context).getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesStates>(
      builder: (context, state) {
        if (state is GetFavoritesSuccessState) {
          if (state.movies.isEmpty) {
            return const Center(
              child: Text('No Favorites Yet'),
            );
          } else {
            return SafeArea(
              child: ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 60,
                    bottom: 60,
                    left: 16,
                    right: 16,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return FavoriteItem(
                      movie: state.movies[index],
                    );
                  }),
            );
          }
        } else if (state is GetFavoritesFailureState) {
          return ErrorView(
            errMessage: state.errMessage,
            onPressed: () {
              BlocProvider.of<FavoritesCubit>(context).getFavorites();
            },
          );
        } else if (state is GetFavoritesLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
