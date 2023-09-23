import 'package:get_it/get_it.dart';
import 'package:photoplay/Features/auth/data/auth_repo_impl.dart';
import 'package:photoplay/Features/home/data/repos/home_repo_impl.dart';
import 'package:photoplay/Features/profile/data/repos/user_account_repo/user_account_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  getIt.registerSingletonAsync<SharedPreferences>(
    () async => prefs,
  );
  await getIt.allReady(); // wait for SharedPreferences singletons to be ready

  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
  getIt.registerSingleton<UserAccountRepoImpl>(UserAccountRepoImpl());
}
