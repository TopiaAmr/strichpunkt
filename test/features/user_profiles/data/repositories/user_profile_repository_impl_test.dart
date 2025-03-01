import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:strichpunkt/core/error/failures.dart';
import 'package:strichpunkt/core/network/network_info.dart';
import 'package:strichpunkt/features/user_profiles/data/datasources/user_profile_local_data_source.dart';
import 'package:strichpunkt/features/user_profiles/data/datasources/user_profile_remote_data_source.dart';
import 'package:strichpunkt/features/user_profiles/data/repositories/user_profile_repository_impl.dart';
import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

// Generate mocks
@GenerateMocks([UserProfileRemoteDataSource, UserProfileLocalDataSource, NetworkInfo])
import 'user_profile_repository_impl_test.mocks.dart';

void main() {
  late UserProfileRepositoryImpl repository;
  late MockUserProfileRemoteDataSource mockRemoteDataSource;
  late MockUserProfileLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockUserProfileRemoteDataSource();
    mockLocalDataSource = MockUserProfileLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = UserProfileRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  // Test data
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

  group('getUserProfile', () {
    test('should check if the device is online', () async {
      // Arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.getUserProfiles())
          .thenAnswer((_) async => tUserProfiles);
      
      // Act
      await repository.getUserProfile();
      
      // Assert
      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when the call to remote data source is successful', () async {
        // Arrange
        when(mockRemoteDataSource.getUserProfiles())
            .thenAnswer((_) async => tUserProfiles);
        
        // Act
        final result = await repository.getUserProfile();
        
        // Assert
        verify(mockRemoteDataSource.getUserProfiles());
        expect(result, equals(Right(tUserProfiles)));
      });

      test('should return server failure when the call to remote data source is unsuccessful', () async {
        // Arrange
        when(mockRemoteDataSource.getUserProfiles())
            .thenThrow(Exception('Server error'));
        
        // Act
        final result = await repository.getUserProfile();
        
        // Assert
        verify(mockRemoteDataSource.getUserProfiles());
        expect(result.isLeft(), true);
        result.fold(
          (failure) => expect(failure, isA<ServerFailure>()),
          (_) => fail('Should have been a Left with a ServerFailure'),
        );
      });
    });

    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return a network error when device is offline', () async {
        // Act
        final result = await repository.getUserProfile();
        
        // Assert
        verifyZeroInteractions(mockRemoteDataSource);
        expect(result.isLeft(), true);
        result.fold(
          (failure) {
            expect(failure, isA<ServerFailure>());
            expect(failure.message, 'No internet connection');
          },
          (_) => fail('Should have been a Left with a ServerFailure'),
        );
      });
    });
  });
}
