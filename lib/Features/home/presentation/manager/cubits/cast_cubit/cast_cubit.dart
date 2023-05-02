import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/home/data/models/cast_model.dart';
import 'package:photoplay/Features/home/data/repos/home_repo.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastStates> {
  CastCubit({required this.homeRepo}) : super(CastInitialState());
  HomeRepo homeRepo;

  Future getMovieCast({required int movieId}) async {
    emit(GetMovieCastLoadingState());
    var result = await homeRepo.getMovieCast(movieId: movieId);

    result.fold((failure) {
      emit(GetMovieCastFailureState(failure.errMessage));
    }, (movieCast) {
      emit(GetMovieCastSuccessState(movieCast));
    });
  }

  Future getCastDetails({required int castId}) async {
    emit(GetCastDetailsLoadingState());
    var result = await homeRepo.getCastDetails(castId: castId);

    result.fold((failure) {
      emit(GetCastDetailsFailureState(failure.errMessage));
    }, (castDetails) {
      emit(GetCastDetailsSuccessState(castDetails));
    });
  }
}
