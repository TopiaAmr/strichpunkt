import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_profile.dart';
import '../repositories/user_profile_repository.dart';

class GetUserProfilesUsecase {
  final UserProfileRepository repository;

  GetUserProfilesUsecase(this.repository);

  Future<Either<Failure, List<UserProfile>>> call() async {
    return await repository.getUserProfile();
  }
}
