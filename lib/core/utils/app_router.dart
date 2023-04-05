import 'package:go_router/go_router.dart';
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
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: registerViewPath,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: resetPasswordViewPath,
        builder: (context, state) => const ResetPasswordView(),
      ),
    ],
  );
}
