import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

abstract class UserProfileLocalDataSource {
  Future<List<UserProfile>> getUserProfiles();
}

class UserProfileLocalDataSourceImpl implements UserProfileLocalDataSource {
  @override
  Future<List<UserProfile>> getUserProfiles() async{
    return [];
  }
}
