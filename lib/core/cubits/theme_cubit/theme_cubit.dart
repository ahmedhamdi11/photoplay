import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitialState());
  bool isDarkTheme = false;
  getThemeFromPrefs(bool? themeFromPrefs) async {
    if (themeFromPrefs != null) {
      isDarkTheme = themeFromPrefs;
      emit(GetThemeFromPrefsState());
    }
  }

  toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkTheme = !isDarkTheme;
    prefs.setBool('isDarkTheme', isDarkTheme);
    emit(ToggleThemeState());
  }
}
