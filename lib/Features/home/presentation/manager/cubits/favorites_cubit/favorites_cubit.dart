import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/home/data/repos/home_repo.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {
  FavoritesCubit({required this.homeRepo}) : super(FavoritesInitialState());
  HomeRepo homeRepo;
  Future addToFavorites({required Map<String, dynamic> favoriteItem}) async {
    emit(AddToFavoritesLoadingState());
    var result = await homeRepo.addToFavorites(favoriteItem: favoriteItem);

    result.fold(
      (failure) {
        emit(AddToFavoritesFailureState(failure.errMessage));
      },
      (success) {
        emit(AddToFavoritesSuccessState(success));
      },
    );
  }
}
