import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:strichpunkt/core/error/failures.dart';
import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';
import 'package:strichpunkt/features/user_profiles/domain/usecases/get_user_profile.dart';
import 'package:strichpunkt/features/user_profiles/presentation/cubits/get_user_profiles_cubit.dart';
import 'package:strichpunkt/features/user_profiles/presentation/cubits/get_user_profiles_state.dart';

// Generate mock
@GenerateMocks([GetUserProfilesUsecase])
import 'get_user_profiles_cubit_test.mocks.dart';

void main() {
  late GetUserProfilesCubit cubit;
  late MockGetUserProfilesUsecase mockUsecase;

  setUp(() {
    mockUsecase = MockGetUserProfilesUsecase();
    cubit = GetUserProfilesCubit(mockUsecase);
  });

  tearDown(() {
    cubit.close();
  });

  test('initial state should be GetUserProfilesState.initial()', () {
    // Assert
    expect(cubit.state, GetUserProfilesState.initial());
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

  group('getUserProfiles', () {
    blocTest<GetUserProfilesCubit, GetUserProfilesState>(
      'should emit [loading, loaded] when data is gotten successfully',
      build: () {
        when(mockUsecase.call())
            .thenAnswer((_) async => Right(tUserProfiles));
        return cubit;
      },
      act: (cubit) => cubit.getUserProfiles(),
      expect: () => [
        GetUserProfilesState.initial().copyWith(isLoading: true),
        GetUserProfilesState.initial().copyWith(
          profiles: tUserProfiles,
          isLoading: false,
        ),
      ],
      verify: (cubit) {
        verify(mockUsecase.call());
      },
    );

    blocTest<GetUserProfilesCubit, GetUserProfilesState>(
      'should emit [loading, error] when getting data fails',
      build: () {
        when(mockUsecase.call())
            .thenAnswer((_) async => Left(ServerFailure(message: 'Server error')));
        return cubit;
      },
      act: (cubit) => cubit.getUserProfiles(),
      expect: () => [
        GetUserProfilesState.initial().copyWith(isLoading: true),
        GetUserProfilesState.initial().copyWith(
          isError: true,
          message: 'Server error',
          isLoading: false,
          profiles: [],
        ),
      ],
      verify: (cubit) {
        verify(mockUsecase.call());
      },
    );
  });
}
