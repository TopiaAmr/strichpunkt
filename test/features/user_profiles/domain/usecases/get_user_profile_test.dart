import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';
import 'package:strichpunkt/features/user_profiles/domain/repositories/user_profile_repository.dart';
import 'package:strichpunkt/features/user_profiles/domain/usecases/get_user_profile.dart';

// Generate mock
@GenerateMocks([UserProfileRepository])
import 'get_user_profile_test.mocks.dart';

void main() {
  late GetUserProfilesUsecase usecase;
  late MockUserProfileRepository mockRepository;

  setUp(() {
    mockRepository = MockUserProfileRepository();
    usecase = GetUserProfilesUsecase(mockRepository);
  });

  final tUserProfiles = [
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
  ];

  test('should get user profiles from the repository', () async {
    // Arrange
    when(mockRepository.getUserProfile())
        .thenAnswer((_) async => Right(tUserProfiles));
    
    // Act
    final result = await usecase();
    
    // Assert
    expect(result, Right(tUserProfiles));
    verify(mockRepository.getUserProfile());
    verifyNoMoreInteractions(mockRepository);
  });
}
