import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/home/data/models/videos_model.dart';
import 'package:photoplay/Features/home/data/repos/home_repo.dart';

part 'trailers_state.dart';

class TrailersCubit extends Cubit<TrailersStates> {
  TrailersCubit({required this.homeRepo}) : super(TrailersInitialState());
  HomeRepo homeRepo;

  VideosModel? trailerVideo;
  Future getMovieTrailer({required int movieId}) async {
    emit(GetTrailerLoadingState());
    var result = await homeRepo.getMovieTrailer(movieId: movieId);

    result.fold(
      (failure) {
        emit(GetTrailerFailureState(failure.errMessage));
      },
      (trailer) {
        trailerVideo = trailer;
        emit(GetTrailerSuccessState());
      },
    );
  }

  VideosModel? tvTrailer;
  Future getTvTrailer({required int tvId}) async {
    emit(GetTrailerLoadingState());
    var result = await homeRepo.getTvTrailer(tvId: tvId);

    result.fold(
      (failure) {
        emit(GetTrailerFailureState(failure.errMessage));
      },
      (trailer) {
        trailerVideo = trailer;
        emit(GetTrailerSuccessState());
      },
    );
  }
}
