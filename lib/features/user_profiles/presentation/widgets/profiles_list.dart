import 'package:flutter/material.dart';
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
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
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
    );
  }
}
