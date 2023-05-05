import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photoplay/Features/favorites/data/repos/favorites_repo/favorites_repo_impl.dart';
import 'package:photoplay/Features/favorites/presentation/manager/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:photoplay/constants.dart';
import 'package:photoplay/core/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:photoplay/core/utils/cash_helper.dart';
import 'firebase_options.dart';
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CashHelper.init();
  CashHelper.uId = CashHelper.prefs.getString('uId');
  Bloc.observer = MyBlocObserver();
  runApp(const PhotoPlay());
}

class PhotoPlay extends StatelessWidget {
  const PhotoPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesCubit(favoritesRepo: FavoritesRepoImpl()),
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(
          colorSchemeSeed: kPrimatyColor,
          // textSelectionTheme: TextSelectionThemeData(
          // selectionColor: kPrimatyColor, selectionHandleColor: kPrimatyColor),
          fontFamily: 'Gotham',
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
        ),
      ),
    );
  }
}
