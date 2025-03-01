import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_profile.dart';
import '../repositories/user_profile_repository.dart';

/// Use case for retrieving user profiles.
///
/// This use case encapsulates the business logic for retrieving user profiles
/// from the repository. It follows the Clean Architecture pattern by acting as
/// an intermediary between the presentation layer and the repository.
class GetUserProfilesUsecase {
  /// The repository that this use case will interact with
  final UserProfileRepository repository;

  /// Creates a new [GetUserProfilesUsecase] instance with the given repository.
  GetUserProfilesUsecase(this.repository);

  /// Executes the use case to retrieve user profiles.
  ///
  /// Returns either a [Failure] if an error occurs or a list of [UserProfile] entities.
  /// This method is callable, allowing the use case to be invoked directly.
  Future<Either<Failure, List<UserProfile>>> call() async {
    return await repository.getUserProfile();
  }
}
