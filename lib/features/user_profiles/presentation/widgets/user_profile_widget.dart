import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/user_profile.dart';
import 'add_profile_button.dart';
import 'profiles_list.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // This would normally come from the BLoC, but for UI demo we'll use mock data
    final mockProfiles = [
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
      UserProfile(
        id: '2',
        name: 'Matthew Brian',
        svnNumber: '123 456 789',
        avatarUrl: 'assets/images/avatar2.png',
        relation: 'My Father',
        status: ProfileStatus.unverified,
        connectCount: 0,
        medicineCount: 5,
        consultCount: 0,
        isCurrentlyInUse: false,
      ),
      UserProfile(
        id: '3',
        name: 'Erica Jason',
        svnNumber: '123 456 789',
        avatarUrl: 'assets/images/avatar3.png',
        relation: 'My mother',
        status: ProfileStatus.pending,
        connectCount: 0,
        medicineCount: 9,
        consultCount: 3,
        isCurrentlyInUse: false,
      ),
    ];

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Profiles',
          style: AppTheme.headingStyle,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: AddProfileButton(
              onPressed: () {
                // Handle add new profile
              },
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: AppTheme.backgroundColor,
      ),
      body: ProfilesList(
        profiles: mockProfiles,
        onEdit: (profile) {
          // Handle edit profile
        },
        onSwitchProfile: (profile) {
          // Handle switch profile
        },
        onConnection: (profile) {
          // Handle connection
        },
      ),
    );
  }
}
