import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/data/auth_repo_impl.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/register_cubit/register_cubit.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/social_signin_cubit/social_signin_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/login_view.dart';
import 'package:photoplay/Features/auth/presentation/views/register_view.dart';
import 'package:photoplay/Features/auth/presentation/views/reset_password_view.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/data/repos/home_repo_impl.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/cast_cubit/cast_cubit.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/get_more_movies_cubit/get_more_movies_cubit.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/home_cubit/home_cubit.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/known_for_cubit/known_for_cubit.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/trailers_cubit/trailers_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/home_view.dart';
import 'package:photoplay/Features/home/presentation/views/more_now_playing.dart';
import 'package:photoplay/Features/home/presentation/views/more_top_rated.dart';
import 'package:photoplay/Features/home/presentation/views/movie_details_view.dart';
import 'package:photoplay/Features/home/presentation/views/person_details_view.dart';
import 'package:photoplay/Features/profile/data/repos/user_account_repo/user_account_repo_impl.dart';
import 'package:photoplay/Features/profile/presentation/manager/cubits/cubit/user_account_cubit.dart';
import 'package:photoplay/Features/profile/presentation/views/user_account_view.dart';
import 'package:photoplay/Features/profile/presentation/views/settings_view.dart';
import 'package:photoplay/core/functions/page_transition.dart';
import 'package:photoplay/core/utils/globals.dart';
import 'package:photoplay/core/utils/service_locator.dart';

abstract class AppRouter {
  static const registerViewPath = '/registerView';
  static const resetPasswordViewPath = '/resetPasswordView';
  static const homeViewPath = '/homeView';
  static const movieDetailsViewPath = '/movieDetailsViewPath';
  static const personDetailsViewPath = '/personDetailsViewPath';
  static const settingsViewPath = '/settingsViewPath';
  static const moreNowPlayingPath = '/moreNowPlayingPath';
  static const moreTopRatedPath = '/moreTopRatedPath';
  static const accountViewPath = '/accountViewPath';

  static GoRouter router = GoRouter(
    initialLocation: Globals.uId == null ? '/' : homeViewPath,
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => defaultTransitionPage(
          key: state.pageKey,
          beginOffset: const Offset(0, 1),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    LoginCubit(authRepo: getIt.get<AuthRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    SocialSignInCubit(authRepo: getIt.get<AuthRepoImpl>()),
              ),
            ],
            child: const LoginView(),
          ),
        ),
      ),

      GoRoute(
        path: registerViewPath,
        pageBuilder: (context, state) {
          return defaultTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) =>
                  RegisterCubit(authRepo: getIt.get<AuthRepoImpl>()),
              child: const RegisterView(),
            ),
          );
        },
      ),

      GoRoute(
        path: resetPasswordViewPath,
        pageBuilder: (context, state) => defaultTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) =>
                ResetPasswordCubit(authRepo: getIt.get<AuthRepoImpl>()),
            child: const ResetPasswordView(),
          ),
        ),
      ),

      GoRoute(
        path: homeViewPath,
        pageBuilder: (context, state) => defaultTransitionPage(
          key: state.pageKey,
          beginOffset: const Offset(0, 1),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())
                    ..getNowPlayingMovies()
                    ..getTopRatedMovies()
                    ..getTrendingMovies()),
            ],
            child: const HomeView(),
          ),
        ),
      ),

      GoRoute(
        path: movieDetailsViewPath,
        pageBuilder: (context, state) => defaultTransitionPage(
          key: state.pageKey,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CastCubit(homeRepo: getIt.get<HomeRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    TrailersCubit(homeRepo: getIt.get<HomeRepoImpl>()),
              ),
            ],
            child: MovieDetailsView(
              movie: state.extra as MovieModel,
            ),
          ),
        ),
      ),

      GoRoute(
        path: personDetailsViewPath,
        pageBuilder: (context, state) => defaultTransitionPage(
          key: state.pageKey,
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    CastCubit(homeRepo: getIt.get<HomeRepoImpl>()),
              ),
              BlocProvider(
                create: (context) =>
                    KnownForCubit(homeRepo: getIt.get<HomeRepoImpl>()),
              ),
            ],
            child: PersonDetailsView(
              castId: state.extra as int,
            ),
          ),
        ),
      ),

      GoRoute(
        path: settingsViewPath,
        pageBuilder: (context, state) => defaultTransitionPage(
          key: state.pageKey,
          child: const SettingsView(),
        ),
      ),

      GoRoute(
        path: moreNowPlayingPath,
        pageBuilder: (context, state) => defaultTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => GetMoreMoviesCubit(getIt.get<HomeRepoImpl>())
              ..getMoreNowPlaying(),
            child: const MoreNowPlaying(),
          ),
        ),
      ),

      GoRoute(
        path: moreTopRatedPath,
        pageBuilder: (context, state) => defaultTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => GetMoreMoviesCubit(getIt.get<HomeRepoImpl>())
              ..getMoreTopRated(),
            child: const MoreTopRatedView(),
          ),
        ),
      ),

      // user account
      GoRoute(
        path: accountViewPath,
        pageBuilder: (context, state) => defaultTransitionPage(
          key: state.pageKey,
          child: BlocProvider(
            create: (context) => UserAccountCubit(
                userAccountRepo: getIt.get<UserAccountRepoImpl>()),
            child: const UserAccountView(),
          ),
        ),
      ),
    ],
  );
}
