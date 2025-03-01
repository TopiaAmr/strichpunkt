import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

/// Interface for the local data source of user profiles.
///
/// This interface defines the contract for retrieving user profiles
/// from a local source, such as a database or shared preferences.
abstract class UserProfileLocalDataSource {
  /// Retrieves a list of user profiles from the local source.
  ///
  /// Returns a [Future] that completes with a list of [UserProfile] entities.
  /// The list may be empty if no profiles are found locally.
  Future<List<UserProfile>> getUserProfiles();
}

/// Implementation of [UserProfileLocalDataSource] that retrieves user profiles
/// from local storage.
///
/// Currently, this implementation returns an empty list, but it can be
/// extended to retrieve profiles from a local database or other storage.
class UserProfileLocalDataSourceImpl implements UserProfileLocalDataSource {
  /// Retrieves user profiles from local storage.
  ///
  /// Currently returns an empty list. This method can be extended to
  /// retrieve profiles from a local database or other storage mechanism.
  @override
  Future<List<UserProfile>> getUserProfiles() async{
    return [];
  }
}
