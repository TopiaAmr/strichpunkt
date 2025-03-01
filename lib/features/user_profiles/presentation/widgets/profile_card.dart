import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/user_profile.dart';
import 'profile_avatar.dart';
import 'profile_stat_item.dart';
import 'status_badge.dart';
import 'profile_action_button.dart';

class ProfileCard extends StatelessWidget {
  final UserProfile profile;
  final VoidCallback onEdit;
  final VoidCallback onSwitchProfile;
  final VoidCallback onConnection;

  const ProfileCard({
    super.key,
    required this.profile,
    required this.onEdit,
    required this.onSwitchProfile,
    required this.onConnection,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: profile.isCurrentlyInUse 
            ? AppTheme.accentColor.withValues(alpha: 0.05) 
            : AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 8),
          _buildProfileStats(),
          const SizedBox(height: 8),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          ProfileAvatar(imageUrl: profile.avatarUrl, size: 50),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: AppTheme.bodyStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'SVN: ${profile.svnNumber}',
                  style: AppTheme.captionStyle,
                ),
              ],
            ),
          ),
          StatusBadge(status: profile.status),
        ],
      ),
    );
  }

  Widget _buildProfileStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          ProfileStatItem(
            icon: Icons.person,
            label: profile.relation,
            count: 0,
          ),
          const SizedBox(width: 16),
          if (profile.connectCount > 0)
            ProfileStatItem(
              icon: Icons.link,
              label: 'Connect',
              count: profile.connectCount,
            ),
          const SizedBox(width: 16),
          if (profile.medicineCount > 0)
            ProfileStatItem(
              icon: Icons.medication,
              label: 'Medicine',
              count: profile.medicineCount,
            ),
          const SizedBox(width: 16),
          if (profile.consultCount > 0)
            ProfileStatItem(
              icon: Icons.medical_services,
              label: 'Consult',
              count: profile.consultCount,
            ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    if (profile.isCurrentlyInUse) {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: ProfileActionButton(
                actionType: ProfileActionType.connection,
                onPressed: onConnection,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ProfileActionButton(
                actionType: ProfileActionType.edit,
                onPressed: onEdit,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ProfileActionButton(
                actionType: ProfileActionType.currentlyUse,
                onPressed: () {},
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: ProfileActionButton(
                actionType: ProfileActionType.edit,
                onPressed: onEdit,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ProfileActionButton(
                actionType: ProfileActionType.switchProfile,
                onPressed: onSwitchProfile,
              ),
            ),
          ],
        ),
      );
    }
  }
}
