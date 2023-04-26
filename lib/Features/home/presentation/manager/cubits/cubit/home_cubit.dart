import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
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
    }
    emit(ChangeBNavigationBarState());
  }

  Future getNowPlayingMovies() async {
    emit(GetNowPlayingMoviesLoadingState());
    var result = await homeRepo.getNowPlayingMovies();

    result.fold((failure) {
      print(failure.errMessage);
      emit(GetNowPlayingMoviesFailureState(failure.errMessage));
    }, (movie) {
      emit(GetNowPlayingMoviesSuccessState(movie));
    });
  }
}
