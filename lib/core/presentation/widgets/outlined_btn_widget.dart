import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_theme.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Widget? icon;

  const OutlinedButtonWidget({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: AppTheme.primaryColor,
        side: BorderSide(color: AppTheme.primaryColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        padding: EdgeInsets.all(8.sp),
      ),
      icon: icon ?? Icon(Icons.add, size: 12.sp),

      label: Text(
        label,
        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500),
      ),
    );
  }
}
