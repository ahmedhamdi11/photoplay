import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/data/repos/home_repo.dart';

part 'known_for_state.dart';

class KnownForCubit extends Cubit<KnownForStates> {
  KnownForCubit({required this.homeRepo}) : super(KnownForInitialSate());
  HomeRepo homeRepo;
  Future getKnownForList({required int castId}) async {
    emit(GetKnownForListLoadingState());
    var result = await homeRepo.getKnownForList(castId: castId);

    result.fold((failure) {
      emit(GetKnownForListFailureState(failure.errMessage));
    }, (movies) {
      emit(GetKnownForListSuccessState(movies));
    });
  }
}
