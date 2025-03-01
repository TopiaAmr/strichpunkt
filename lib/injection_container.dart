import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';
import 'features/user_profiles/data/datasources/user_profile_local_data_source.dart';
import 'features/user_profiles/data/datasources/user_profile_remote_data_source.dart';
import 'features/user_profiles/data/repositories/user_profile_repository_impl.dart';
import 'features/user_profiles/domain/repositories/user_profile_repository.dart';
import 'features/user_profiles/domain/usecases/get_user_profile.dart';
import 'features/user_profiles/presentation/bloc/user_profile_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - User Profiles
  // Bloc
  sl.registerFactory(
    () => UserProfileBloc(),
  );

  // Use cases
  sl.registerLazySingleton(() => GetUserProfile(sl()));

  // Repository
  sl.registerLazySingleton<UserProfileRepository>(
    () => UserProfileRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<UserProfileRemoteDataSource>(
    () => UserProfileRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<UserProfileLocalDataSource>(
    () => UserProfileLocalDataSourceImpl(),
  );

  //! Core
  sl.registerLazySingleton(() => InputConverter());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
