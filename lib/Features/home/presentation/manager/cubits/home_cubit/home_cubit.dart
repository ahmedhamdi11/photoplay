import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/data/models/trending_model.dart';
import 'package:photoplay/Features/home/data/repos/home_repo.dart';
import 'package:photoplay/Features/home/presentation/views/downloads_view.dart';
import 'package:photoplay/Features/home/presentation/views/profile_view.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:photoplay/Features/home/presentation/views/search_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(HomeInitialState());
  final HomeRepo homeRepo;
  int currentIndex = 0;
  List views = const [
    HomeViewBody(),
    SearchView(),
    DownloadsView(),
    ProfileView(),
  ];
  changeBNavigationBar({required int index}) {
    currentIndex = index;
    if (currentIndex == 0) {
      getNowPlayingMovies();
      getPopularMovies();
    }
    emit(ChangeBNavigationBarState());
  }

  List<MovieModel>? nowPlayingMovies;
  Future getNowPlayingMovies() async {
    emit(GetNowPlayingMoviesLoadingState());
    var result = await homeRepo.getNowPlayingMovies();

    result.fold((failure) {
      emit(GetNowPlayingMoviesFailureState(failure.errMessage));
    }, (movies) {
      nowPlayingMovies = movies;
      emit(GetNowPlayingMoviesSuccessState());
    });
  }

  List<MovieModel>? popularMovies;
  Future getPopularMovies() async {
    emit(GetPopularMoviesLoadingState());
    var result = await homeRepo.getPopularMovies();

    result.fold((failure) {
      emit(GetPopularMoviesFailureState(failure.errMessage));
    }, (movies) {
      popularMovies = movies;
      emit(GetPopularMoviesSuccessState());
    });
  }

  List<TrendingModel>? trendingMovies;
  Future getTrendingMovies() async {
    emit(GetPopularMoviesLoadingState());
    var result = await homeRepo.getTrendingMovies();

    result.fold((failure) {
      emit(GetPopularMoviesFailureState(failure.errMessage));
    }, (movies) {
      trendingMovies = movies;
      emit(GetPopularMoviesSuccessState());
    });
  }
}