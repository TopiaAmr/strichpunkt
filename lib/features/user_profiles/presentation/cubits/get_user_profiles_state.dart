// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:strichpunkt/features/user_profiles/domain/entities/user_profile.dart';

class GetUserProfilesState extends Equatable {
  final List<UserProfile> profiles;
  final bool isError;
  final bool isLoading;
  final String message;

  const GetUserProfilesState({
    required this.profiles,
    required this.isError,
    required this.isLoading,
    required this.message,
  });

  factory GetUserProfilesState.initial() => const GetUserProfilesState(
    profiles: [],
    isError: false,
    isLoading: false,
    message: '',
  );

  @override
  List<Object> get props => [profiles, isError, isLoading, message];

  GetUserProfilesState copyWith({
    List<UserProfile>? profiles,
    bool? isError,
    bool? isLoading,
    String? message,
  }) {
    return GetUserProfilesState(
      profiles: profiles ?? this.profiles,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      message: message ?? this.message,
    );
  }
}
