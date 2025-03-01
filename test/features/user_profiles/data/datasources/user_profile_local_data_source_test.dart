import 'package:flutter_test/flutter_test.dart';
import 'package:strichpunkt/features/user_profiles/data/datasources/user_profile_local_data_source.dart';
import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

void main() {
  late UserProfileLocalDataSourceImpl dataSource;

  setUp(() {
    dataSource = UserProfileLocalDataSourceImpl();
  });

  group('getUserProfiles', () {
    test('should return an empty list of UserProfiles', () async {
      // Act
      final result = await dataSource.getUserProfiles();
      
      // Assert
      expect(result, isA<List<UserProfile>>());
      expect(result.isEmpty, true);
    });
  });
}
