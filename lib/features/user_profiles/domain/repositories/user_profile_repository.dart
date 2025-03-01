import 'package:dartz/dartz.dart';
import 'package:strichpunkt/core/error/failures.dart';
import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

abstract class UserProfileRepository {
  Future<Either<Failure, List<UserProfile>>> getUserProfile();
}
