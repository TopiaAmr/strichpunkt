import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProfileHeader(),
          if (profile.status != ProfileStatus.verified)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Divider(
                height: 12.h,
                thickness: 0.5,
                color: AppTheme.grayColor,
              ),
            )
          else
            SizedBox(height: 12.h),
          _buildProfileStats(),
          Divider(height: 12.h, thickness: 1, color: AppTheme.grayColor),
          _buildActionButtons(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    final isVerified = profile.status == ProfileStatus.verified;
    return Container(
      decoration: BoxDecoration(
        color: isVerified ? AppTheme.verifiedColor : Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(8.r),
      child: Row(
        children: [
          ProfileAvatar(
            imageUrl: profile.avatarUrl,
            size: 48.r,
            showBorder: profile.showBorder,
            borderColor: profile.borderColor,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color:
                        isVerified ? Colors.white : AppTheme.textPrimaryColor,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  'SVN:${profile.svnNumber}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color:
                        isVerified ? Colors.white : AppTheme.textSecondaryColor,
                  ),
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
    final statItems = <Widget>[
      _buildRelationStat(),
      if (profile.relation == 'Me')
        ProfileStatItem(
          svgPath: 'assets/icons/connection.svg',
          label: 'Connect',
          count: profile.connectCount,
        ),
      ProfileStatItem(
        svgPath: 'assets/icons/medication.svg',
        label: 'Medicine',
        count: profile.medicineCount,
      ),
      ProfileStatItem(
        svgPath: 'assets/icons/calendar_with_timer.svg',
        label: 'Consult',
        count: profile.consultCount,
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // If we have enough width, use Row with spaceBetween
        if (constraints.maxWidth >= 300.w) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: statItems,
          );
        } else {
          // Otherwise use Wrap for smaller screens
          return Wrap(spacing: 16.w, runSpacing: 8.h, children: statItems);
        }
      },
    );
  }

  Widget _buildRelationStat() {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/icons/family_member.svg',
              width: 16.r,
              height: 16.r,
              colorFilter: ColorFilter.mode(
                AppTheme.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 4.w),
            Text(
              profile.relation,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppTheme.textPrimaryColor,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    if (profile.isCurrentlyInUse) {
      return Row(
        children: [
          Expanded(
            child: ProfileActionButton(
              actionType: ProfileActionType.connection,
              onPressed: onConnection,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: ProfileActionButton(
              actionType: ProfileActionType.edit,
              onPressed: onEdit,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: ProfileActionButton(
              actionType: ProfileActionType.currentlyUse,
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Expanded(
            child: ProfileActionButton(
              actionType: ProfileActionType.edit,
              onPressed: onEdit,
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: ProfileActionButton(
              actionType: ProfileActionType.switchProfile,
              onPressed: onSwitchProfile,
            ),
          ),
        ],
      );
    }
  }
}
