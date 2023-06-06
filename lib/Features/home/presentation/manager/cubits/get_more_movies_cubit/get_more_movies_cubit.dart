import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/data/repos/home_repo.dart';

part 'get_more_movies_states.dart';

class GetMoreMoviesCubit extends Cubit<GetMoreMoviesStates> {
  GetMoreMoviesCubit(this.homeRepo) : super(GetMoreMoviesInitialState());

  final HomeRepo homeRepo;

  List<MovieModel> nowPlayingMovies = [];

  Future getMoreNowPlaying({int pageNum = 1}) async {
    emit(
      GetMoreMoviesLoadingState(),
    );

    var result = await homeRepo.getMoreNowPlayingMovies(pageNum: pageNum);

    result.fold((failure) {
      emit(GetMoreMoviesFailureState(failure.errMessage));
    }, (movies) {
      nowPlayingMovies.addAll(movies);
      emit(
        GetMoreMoviesSuccessState(movies),
      );
    });
  }

  List<MovieModel> topRatedMovies = [];

  Future getMoreTopRated({int pageNum = 1}) async {
    emit(
      GetMoreMoviesLoadingState(),
    );

    var result = await homeRepo.getMoreTopMovies(pageNum: pageNum);

    result.fold((failure) {
      emit(GetMoreMoviesFailureState(failure.errMessage));
    }, (movies) {
      topRatedMovies.addAll(movies);
      emit(
        GetMoreMoviesSuccessState(movies),
      );
    });
  }
}
