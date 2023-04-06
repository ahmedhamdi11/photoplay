import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/data/auth_repo_impl.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:photoplay/Features/auth/presentation/manager/cubits/register_cubit/register_cubit.dart';
import 'package:photoplay/Features/auth/presentation/views/login_view.dart';
import 'package:photoplay/Features/auth/presentation/views/register_view.dart';
import 'package:photoplay/Features/auth/presentation/views/reset_password_view.dart';

abstract class AppRouter {
  static const registerViewPath = '/registerView';
  static const resetPasswordViewPath = '/resetPasswordView';
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(authRepo: AuthRepoImpl()),
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
        builder: (context, state) => const ResetPasswordView(),
      ),
    ],
  );
}
