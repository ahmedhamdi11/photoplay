import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/search/data/repos/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit({required this.searchRepo}) : super(SearchInitialState());
  SearchRepo searchRepo;

  late List<MovieModel> moviesSearchData;
  Future fetchSearchData({required String q}) async {
    emit(SearchLoadingState());
    var result = await searchRepo.fetchMoviesSearchData(q: q);
    result.fold(
      (failure) {
        emit(SearchFailureState(failure.errMessage));
      },
      (searchData) {
        moviesSearchData = searchData;
        emit(SearchSuccessState());
      },
    );
  }
}
