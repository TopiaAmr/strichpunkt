import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_profile.dart';
import '../repositories/user_profile_repository.dart';

class GetUserProfile {
  final UserProfileRepository repository;

  GetUserProfile(this.repository);

  Future<Either<Failure, UserProfile>> call(Params params) async {
    // Implementation will be added later
    return Right(UserProfile());
  }
}

class Params extends Equatable {
  // Define parameters here
  
  @override
  List<Object?> get props => [];
}
