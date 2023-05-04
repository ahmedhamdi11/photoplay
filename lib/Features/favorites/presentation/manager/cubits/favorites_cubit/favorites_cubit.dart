import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/favorites/data/repos/favorites_repo/favorites_repo.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {
  FavoritesCubit({required this.favoritesRepo})
      : super(FavoritesInitialState());
  FavoritesRepo favoritesRepo;
  Future addToFavorites({required Map<String, dynamic> favoriteItem}) async {
    emit(AddToFavoritesLoadingState());
    var result = await favoritesRepo.addToFavorites(favoriteItem: favoriteItem);

    result.fold(
      (failure) {
        emit(AddToFavoritesFailureState(failure.errMessage));
      },
      (success) {
        emit(AddToFavoritesSuccessState(success));
      },
    );
  }

  List<MovieModel> favorites = [];
  Future getFavorites() async {
    emit(GetFavoritesLoadingState());
    var result = await favoritesRepo.getFavorites();

    result.fold((failure) {
      emit(GetFavoritesFailureState(failure.errMessage));
    }, (movies) {
      favorites = movies;
      emit(GetFavoritesSuccessState(movies));
    });
  }
}
