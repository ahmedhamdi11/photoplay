import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/home/data/models/cast_model.dart';
import 'package:photoplay/Features/home/data/repos/home_repo.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastStates> {
  CastCubit({required this.homeRepo}) : super(CastInitialState());
  HomeRepo homeRepo;

  Future getMovieCast({required int movieId}) async {
    emit(GetCastLoadingState());
    var result = await homeRepo.getMovieCast(movieId: movieId);

    result.fold((failure) {
      emit(GetCastFailureState(failure.errMessage));
    }, (movieCast) {
      emit(GetCastSuccessState(movieCast));
    });
  }

  Future getTvCast({required int tvId}) async {
    emit(GetCastLoadingState());
    var result = await homeRepo.getTvCast(tvId: tvId);

    result.fold((failure) {
      emit(GetCastFailureState(failure.errMessage));
    }, (movieCast) {
      emit(GetCastSuccessState(movieCast));
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
