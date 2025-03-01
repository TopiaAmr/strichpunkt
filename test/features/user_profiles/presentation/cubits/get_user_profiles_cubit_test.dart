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

/// Generate mock for the [GetUserProfilesUsecase].
@GenerateMocks([GetUserProfilesUsecase])
import 'get_user_profiles_cubit_test.mocks.dart';

/// Tests for the [GetUserProfilesCubit] class.
///
/// These tests verify that the cubit:
/// - Has the correct initial state
/// - Emits the expected states when loading profiles successfully
/// - Emits the expected states when an error occurs
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

  /// Tests that the initial state of the cubit is correct.
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
    /// Tests that the cubit emits the correct states when data is loaded successfully.
    ///
    /// Expected state transitions:
    /// 1. Initial state with isLoading=true
    /// 2. State with profiles loaded and isLoading=false
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

    /// Tests that the cubit emits the correct states when an error occurs.
    ///
    /// Expected state transitions:
    /// 1. Initial state with isLoading=true
    /// 2. State with error=true, error message, and isLoading=false
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
