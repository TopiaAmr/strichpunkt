import 'package:flutter_test/flutter_test.dart';
import 'package:strichpunkt/features/user_profiles/data/datasources/user_profile_local_data_source.dart';
import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

/// Tests for the [UserProfileLocalDataSourceImpl] class.
///
/// These tests verify that the local data source:
/// - Returns an empty list of user profiles as expected in the current implementation
void main() {
  late UserProfileLocalDataSourceImpl dataSource;

  setUp(() {
    dataSource = UserProfileLocalDataSourceImpl();
  });

  group('getUserProfiles', () {
    /// Tests that the local data source returns an empty list of user profiles.
    test('should return an empty list of UserProfiles', () async {
      // Act
      final result = await dataSource.getUserProfiles();
      
      // Assert
      expect(result, isA<List<UserProfile>>());
      expect(result.isEmpty, true);
    });
  });
}
