import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strichpunkt/features/user_profiles/presentation/cubits/get_user_profiles_cubit.dart';
import 'package:strichpunkt/features/user_profiles/presentation/cubits/get_user_profiles_state.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/presentation/widgets/outlined_btn_widget.dart';
import 'profiles_list.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserProfilesCubit, GetUserProfilesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Profiles', style: AppTheme.headingStyle),
            actions: [
              if (!state.isLoading && !state.isError)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: OutlinedButtonWidget(
                    label: "Add New",
                    icon: Icons.add,
                    onPressed: () {
                      // Handle add new profile
                    },
                  ),
                ),
            ],
            elevation: 0,
          ),
          body: Builder(
            builder: (context) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.isError) return Center(child: Text(state.message));
              return ProfilesList(
                profiles: state.profiles,
                onEdit: (profile) {
                  // Handle edit profile
                },
                onSwitchProfile: (profile) {
                  // Handle switch profile
                },
                onConnection: (profile) {
                  // Handle connection
                },
              );
            },
          ),
        );
      },
    );
  }
}
