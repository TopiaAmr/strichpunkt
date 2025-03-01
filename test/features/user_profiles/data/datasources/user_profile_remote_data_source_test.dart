import 'package:flutter_test/flutter_test.dart';
import 'package:strichpunkt/features/user_profiles/data/datasources/user_profile_remote_data_source.dart';
import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

/// Tests for the [UserProfileRemoteDataSourceMockImpl] class.
///
/// These tests verify that the mock remote data source:
/// - Returns a list of user profiles
/// - Contains the expected profile data
void main() {
  late UserProfileRemoteDataSourceMockImpl dataSource;

  setUp(() {
    dataSource = UserProfileRemoteDataSourceMockImpl();
  });

  group('getUserProfiles', () {
    /// Tests that the remote data source returns a list of user profiles
    /// with the expected data.
    test('should return a list of UserProfile models', () async {
      // Act
      final result = await dataSource.getUserProfiles();
      
      // Assert
      expect(result, isA<List<UserProfile>>());
      expect(result.length, 3); // Based on the mock implementation
      
      // Verify specific data in the first profile
      expect(result[0].id, '1');
      expect(result[0].name, 'Matthew Brian');
      expect(result[0].svnNumber, '123 456 789');
      expect(result[0].status, ProfileStatus.verified);
      expect(result[0].isCurrentlyInUse, true);
      
      // Verify specific data in the second profile
      expect(result[1].id, '2');
      expect(result[1].relation, 'My Father');
      expect(result[1].status, ProfileStatus.unverified);
      expect(result[1].showBorder, true);
      
      // Verify specific data in the third profile
      expect(result[2].id, '3');
      expect(result[2].name, 'Erica Jason');
      expect(result[2].status, ProfileStatus.pending);
    });
  });
}
