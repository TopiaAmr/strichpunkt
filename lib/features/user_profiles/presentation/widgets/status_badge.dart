import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../domain/entities/user_profile.dart';

class StatusBadge extends StatelessWidget {
  final ProfileStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _getStatusText(),
            style: TextStyle(
              color: _getStatusColor(),
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(width: 4.w),
          if (status != ProfileStatus.pending)
            Icon(_getStatusIcon(), color: _getStatusColor(), size: 14.r)
          else
            SvgPicture.asset(
              'assets/icons/pending_icon.svg',
              height: 14.r,
              width: 14.r,
            ),
        ],
      ),
    );
  }

  Color _getStatusColor() {
    switch (status) {
      case ProfileStatus.verified:
        return Colors.white; // Green
      case ProfileStatus.unverified:
        return const Color(0xFFE57373); // Red
      case ProfileStatus.pending:
        return const Color(0xFF9E9E9E); // Gray
    }
  }

  String _getStatusText() {
    switch (status) {
      case ProfileStatus.verified:
        return 'Verified';
      case ProfileStatus.unverified:
        return 'Unverified';
      case ProfileStatus.pending:
        return 'Pending';
    }
  }

  IconData _getStatusIcon() {
    switch (status) {
      case ProfileStatus.verified:
        return Icons.check_circle;
      case ProfileStatus.unverified:
        return Icons.cancel;
      case ProfileStatus.pending:
        return Icons.hourglass_empty;
    }
  }
}
