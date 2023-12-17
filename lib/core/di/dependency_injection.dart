import 'package:dio/dio.dart';
import 'package:flutter_advanced/core/networking/api_service.dart';
import 'package:flutter_advanced/core/networking/dio_factory.dart';
import 'package:flutter_advanced/modules/login/logic/toggle/toggle_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../modules/login/data/repos/login_repo.dart';
import '../../modules/login/logic/login_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // MARK: - Dio & ApiService.
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // MARK: - Login.
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  getIt.registerFactory<ToggleObscureTextCubit>(() => ToggleObscureTextCubit());
  getIt.registerFactory<ToggleRememberMeCubit>(() => ToggleRememberMeCubit());

  // MARK: - Home.
  // getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt<ApiService>()));
  // getIt.registerLazySingleton<HomeCubit>(() => HomeCubit(getIt<HomeRepo>()));

  // MARK: - Shared.
}