import 'package:dartz/dartz.dart';

import 'package:strichpunkt/core/error/failures.dart';

import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/user_profile_repository.dart';
import '../datasources/user_profile_local_data_source.dart';
import '../datasources/user_profile_remote_data_source.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource remoteDataSource;
  final UserProfileLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UserProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

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
