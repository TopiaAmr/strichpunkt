import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_theme.dart';

class ProfileStatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;

  const ProfileStatItem({
    super.key,
    required this.icon,
    required this.label,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    // Get the text scale factor to account for accessibility settings
    final textScaleFactor = MediaQuery.of(context).textScaleFactor;
    
    return Flexible(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: (16 * textScaleFactor).r,
              color: AppTheme.primaryColor,
            ),
            SizedBox(width: 4.w),
            Text(
              '$count $label',
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
}
