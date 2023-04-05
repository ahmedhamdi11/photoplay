import 'package:go_router/go_router.dart';
import 'package:photoplay/Features/auth/presentation/views/login_view.dart';
import 'package:photoplay/Features/auth/presentation/views/register_view.dart';

abstract class AppRouter {
  static const registerViewPath = '/registerView';
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
    ],
  );
}
