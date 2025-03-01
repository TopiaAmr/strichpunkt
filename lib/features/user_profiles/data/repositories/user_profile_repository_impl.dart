import 'package:dartz/dartz.dart';

import 'package:strichpunkt/core/error/failures.dart';

import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/user_profile_repository.dart';
import '../datasources/user_profile_local_data_source.dart';
import '../datasources/user_profile_remote_data_source.dart';

/// Implementation of the [UserProfileRepository] interface.
///
/// This class is responsible for coordinating data retrieval from both
/// remote and local data sources based on network connectivity.
class UserProfileRepositoryImpl implements UserProfileRepository {
  /// Remote data source for fetching user profiles from the server
  final UserProfileRemoteDataSource remoteDataSource;
  
  /// Local data source for fetching user profiles from local storage
  final UserProfileLocalDataSource localDataSource;
  
  /// Network info for checking internet connectivity
  final NetworkInfo networkInfo;

  /// Creates a new [UserProfileRepositoryImpl] with the required dependencies.
  UserProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  /// Retrieves user profiles based on network connectivity.
  ///
  /// If the device is connected to the internet, it fetches profiles from the remote data source.
  /// If there's no internet connection, it returns a server failure with an appropriate message.
  ///
  /// Returns either a [Failure] if an error occurs or a list of [UserProfile] entities.
  @override
  Future<Either<Failure, List<UserProfile>>> getUserProfile() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUserProfiles = await remoteDataSource.getUserProfiles();
        return Right(remoteUserProfiles);
      } catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return Left(ServerFailure(message: 'No internet connection'));
    }
  }

  // Implement repository methods here
}
