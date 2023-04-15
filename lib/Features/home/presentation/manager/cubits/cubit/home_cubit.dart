import 'package:bloc/bloc.dart';
import 'package:photoplay/Features/home/presentation/views/downloads_view.dart';
import 'package:photoplay/Features/home/presentation/views/profile_view.dart';
import 'package:photoplay/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:photoplay/Features/home/presentation/views/search_view.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  int currentIndex = 0;
  List views = const [
    HomeViewBody(),
    SearchView(),
    DownloadsView(),
    ProfileView(),
  ];
  changeBNavigationBar({required int index}) {
    currentIndex = index;
    emit(ChangeBNavigationBarState());
  }
}
