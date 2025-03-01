import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:strichpunkt/features/user_profiles/presentation/cubits/get_user_profiles_cubit.dart';

import '../network/network_info.dart';
import 'input_converter.dart';
import '../../features/user_profiles/data/datasources/user_profile_local_data_source.dart';
import '../../features/user_profiles/data/datasources/user_profile_remote_data_source.dart';
import '../../features/user_profiles/data/repositories/user_profile_repository_impl.dart';
import '../../features/user_profiles/domain/repositories/user_profile_repository.dart';
import '../../features/user_profiles/domain/usecases/get_user_profile.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - User Profiles
  // Bloc
  sl.registerLazySingleton(() => GetUserProfilesCubit(sl()));

  // Use cases
  sl.registerLazySingleton(() => GetUserProfilesUsecase(sl()));

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
    () => UserProfileRemoteDataSourceMockImpl(),
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
