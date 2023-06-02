import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/favorites/data/repos/favorites_repo/favorites_repo_impl.dart';
import 'package:photoplay/Features/favorites/presentation/manager/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:photoplay/core/cubits/theme_cubit/theme_cubit.dart';
import 'package:photoplay/core/themes/themes.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:photoplay/core/utils/cash_helper.dart';
import 'package:photoplay/core/utils/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CashHelper.init();
  CashHelper.uId = CashHelper.prefs.getString('uId');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? themeFromPrefs = prefs.getBool('isDarkTheme');
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  runApp(PhotoPlay(
    themeFromPrefs: themeFromPrefs,
  ));
}

class PhotoPlay extends StatelessWidget {
  const PhotoPlay({super.key, this.themeFromPrefs});
  final bool? themeFromPrefs;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FavoritesCubit(favoritesRepo: FavoritesRepoImpl()),
        ),
        BlocProvider(
          create: (context) => ThemeCubit()..getThemeFromPrefs(themeFromPrefs),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            theme: BlocProvider.of<ThemeCubit>(context).isDarkTheme
                ? darkTheme
                : lightTheme,
          );
        },
      ),
    );
  }
}
