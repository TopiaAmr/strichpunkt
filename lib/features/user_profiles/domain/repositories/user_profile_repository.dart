import 'package:dartz/dartz.dart';
import 'package:strichpunkt/core/error/failures.dart';
import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

/// Repository interface for user profiles.
///
/// This repository is responsible for retrieving user profiles from
/// data sources and handling any errors that might occur during the process.
abstract class UserProfileRepository {
  /// Retrieves a list of user profiles.
  ///
  /// Returns either a [Failure] if an error occurs or a list of [UserProfile] entities.
  /// The list may be empty if no profiles are found.
  Future<Either<Failure, List<UserProfile>>> getUserProfile();
}
