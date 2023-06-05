import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/auth/data/auth_repo_impl.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/data/repos/home_repo.dart';
import 'package:photoplay/Features/favorites/presentation/views/favorites_view.dart';
import 'package:photoplay/Features/profile/presentation/views/profile_view.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:photoplay/Features/search/data/repos/search_repo_impl.dart';
import 'package:photoplay/Features/search/presentation/manager/cubits/search_cubit/search_cubit.dart';
import 'package:photoplay/Features/search/presentation/views/search_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(HomeInitialState());
  final HomeRepo homeRepo;
  int currentIndex = 0;
  List views = [
    const HomeViewBody(),
    BlocProvider(
      create: (context) => SearchCubit(searchRepo: SearchRepoImpl()),
      child: const SearchView(),
    ),
    const FavoritesView(),
    BlocProvider(
      create: (context) => SignOutCubit(authRepo: AuthRepoImpl()),
      child: const ProfileView(),
    ),
  ];
  changeBNavigationBar({required int index}) {
    currentIndex = index;
    if (currentIndex == 0) {
      getNowPlayingMovies();
      getTopRatedMovies();
      getTrendingMovies();
    }
    emit(ChangeBNavigationBarState());
  }

  List<MovieModel>? nowPlayingMovies;
  Future getNowPlayingMovies() async {
    var result = await homeRepo.getNowPlayingMovies();

    result.fold((failure) {
      emit(GetNowPlayingMoviesFailureState(failure.errMessage));
    }, (movies) {
      nowPlayingMovies = movies;
      emit(GetNowPlayingMoviesSuccessState());
    });
  }

  List<MovieModel>? topRatedMovies;
  Future getTopRatedMovies() async {
    var result = await homeRepo.getTopRatedMovies();

    result.fold((failure) {
      emit(GetTopRatedMoviesFailureState(failure.errMessage));
    }, (movies) {
      topRatedMovies = movies;
      emit(GetTopRatedMoviesSuccessState());
    });
  }

  List<MovieModel>? trendingMovies;
  Future getTrendingMovies() async {
    var result = await homeRepo.getTrendingMovies();

    result.fold((failure) {
      emit(GetTrendingMoviesFailureState(failure.errMessage));
    }, (movies) {
      trendingMovies = movies;
      emit(GetTrendingMoviesSuccessState());
    });
  }
}
