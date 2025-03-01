import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

abstract class UserProfileRemoteDataSource {
  Future<List<UserProfile>> getUserProfiles();
}

class UserProfileRemoteDataSourceMockImpl
    implements UserProfileRemoteDataSource {
  @override
  Future<List<UserProfile>> getUserProfiles() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      UserProfile(
        id: '1',
        name: 'Matthew Brian',
        svnNumber: '123 456 789',
        avatarUrl: 'assets/images/avatar1.png',
        relation: 'Me',
        status: ProfileStatus.verified,
        connectCount: 2,
        medicineCount: 11,
        consultCount: 2,
        isCurrentlyInUse: true,
      ),
      UserProfile(
        id: '2',
        name: 'Matthew Brian',
        svnNumber: '123 456 789',
        avatarUrl: 'assets/images/avatar2.png',
        relation: 'My Father',
        status: ProfileStatus.unverified,
        connectCount: 0,
        medicineCount: 5,
        consultCount: 0,
        isCurrentlyInUse: false,
      ),
      UserProfile(
        id: '3',
        name: 'Erica Jason',
        svnNumber: '123 456 789',
        avatarUrl: 'assets/images/avatar3.png',
        relation: 'My mother',
        status: ProfileStatus.pending,
        connectCount: 0,
        medicineCount: 9,
        consultCount: 3,
        isCurrentlyInUse: false,
      ),
    ];
  }
}
