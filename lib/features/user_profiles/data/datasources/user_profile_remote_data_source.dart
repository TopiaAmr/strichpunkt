import 'package:strichpunkt/core/theme/app_theme.dart';
import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

/// Interface for the remote data source of user profiles.
///
/// This interface defines the contract for retrieving user profiles
/// from a remote source, such as an API or a server.
abstract class UserProfileRemoteDataSource {
  /// Retrieves a list of user profiles from the remote source.
  ///
  /// Returns a [Future] that completes with a list of [UserProfile] entities.
  /// May throw an exception if the retrieval fails.
  Future<List<UserProfile>> getUserProfiles();
}

/// Mock implementation of [UserProfileRemoteDataSource] for development and testing.
///
/// This implementation returns a predefined list of user profiles after a simulated delay.
/// It's useful for development, testing, and UI demonstrations before the actual
/// remote data source is implemented.
class UserProfileRemoteDataSourceMockImpl
    implements UserProfileRemoteDataSource {
  /// Retrieves a mock list of user profiles.
  ///
  /// Returns a [Future] that completes with a predefined list of [UserProfile] entities
  /// after a 1-second delay to simulate network latency.
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
        showBorder: true,
        borderColor: AppTheme.primaryColor,
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
        showBorder: true,
        borderColor: AppTheme.secondaryColor,
      ),
    ];
  }
}
