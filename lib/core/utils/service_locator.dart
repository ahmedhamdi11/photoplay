import 'package:get_it/get_it.dart';
import 'package:photoplay/Features/auth/data/auth_repo_impl.dart';
import 'package:photoplay/Features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

setupServiceLocator() {
  getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl());
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl());
}
