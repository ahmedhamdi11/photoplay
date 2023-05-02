import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/data/auth_repo_impl.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/register_cubit/register_cubit.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/reset_password_cubit/reset_password_cubit.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/sign_out_cubit/sign_out_cubit.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/social_signin_cubit/social_signin_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/login_view.dart';
import 'package:photoplay/Features/auth/presentation/views/register_view.dart';
import 'package:photoplay/Features/auth/presentation/views/reset_password_view.dart';
import 'package:photoplay/Features/home/data/models/movie_model.dart';
import 'package:photoplay/Features/home/data/repos/home_repo_impl.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/cast_cubit/cast_cubit.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/home_cubit/home_cubit.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/known_for_cubit/known_for_cubit.dart';
import 'package:photoplay/Features/home/presentation/manager/cubits/trailers_cubit/trailers_cubit.dart';
import 'package:photoplay/Features/home/presentation/views/home_view.dart';
import 'package:photoplay/Features/home/presentation/views/movie_details_view.dart';
import 'package:photoplay/Features/home/presentation/views/person_details_view.dart';
import 'package:photoplay/core/utils/cash_helper.dart';

abstract class AppRouter {
  static const registerViewPath = '/registerView';
  static const resetPasswordViewPath = '/resetPasswordView';
  static const homeViewPath = '/homeView';
  static const movieDetailsViewPath = '/movieDetailsViewPath';
  static const personDetailsViewPath = '/personDetailsViewPath';
  static GoRouter router = GoRouter(
    initialLocation: CashHelper.uId == null ? '/' : homeViewPath,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => LoginCubit(authRepo: AuthRepoImpl()),
            ),
            BlocProvider(
              create: (context) => SocialSignInCubit(authRepo: AuthRepoImpl()),
            ),
          ],
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: registerViewPath,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(authRepo: AuthRepoImpl()),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: resetPasswordViewPath,
        builder: (context, state) => BlocProvider(
          create: (context) => ResetPasswordCubit(authRepo: AuthRepoImpl()),
          child: const ResetPasswordView(),
        ),
      ),
      GoRoute(
        path: homeViewPath,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => HomeCubit(HomeRepoImpl())
                  ..getNowPlayingMovies()
                  ..getPopularMovies()
                  ..getTrendingMovies()),
            BlocProvider(
                create: (context) => SignOutCubit(authRepo: AuthRepoImpl())),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: movieDetailsViewPath,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => CastCubit(homeRepo: HomeRepoImpl())),
            BlocProvider(
                create: (context) => TrailersCubit(homeRepo: HomeRepoImpl())),
          ],
          child: MovieDetailsView(
            movie: state.extra as MovieModel,
          ),
        ),
      ),
      GoRoute(
        path: personDetailsViewPath,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => CastCubit(homeRepo: HomeRepoImpl())),
            BlocProvider(
                create: (context) => KnownForCubit(homeRepo: HomeRepoImpl())),
          ],
          child: PersonDetailsView(
            castId: state.extra as int,
          ),
        ),
      ),
    ],
  );
}
