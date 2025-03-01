import 'dart:math' as math;

import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:strichpunkt/core/theme/app_theme.dart';
import 'package:strichpunkt/features/user_profiles/presentation/cubits/get_user_profiles_cubit.dart';
import '../../domain/entities/user_profile.dart';
import 'profile_card.dart';

class ProfilesList extends StatelessWidget {
  final List<UserProfile> profiles;
  final Function(UserProfile) onEdit;
  final Function(UserProfile) onSwitchProfile;
  final Function(UserProfile) onConnection;

  const ProfilesList({
    super.key,
    required this.profiles,
    required this.onEdit,
    required this.onSwitchProfile,
    required this.onConnection,
  });

  @override
  Widget build(BuildContext context) {
    return CustomMaterialIndicator(
      onRefresh: () async {
        context.read<GetUserProfilesCubit>().getUserProfiles();
      },
      indicatorBuilder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: CircularProgressIndicator(
            color: AppTheme.secondaryColor,
            value:
                controller.state.isLoading
                    ? null
                    : math.min(controller.value, 1.0),
          ),
        );
      },
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return ProfileCard(
            profile: profile,
            onEdit: () => onEdit(profile),
            onSwitchProfile: () => onSwitchProfile(profile),
            onConnection: () => onConnection(profile),
          );
        },
      ),
    );
  }
}
