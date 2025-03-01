import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_theme.dart';

enum ProfileActionType { connection, edit, currentlyUse, switchProfile }

class ProfileActionButton extends StatelessWidget {
  final ProfileActionType actionType;
  final VoidCallback? onPressed;

  const ProfileActionButton({
    super.key,
    required this.actionType,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          foregroundColor: _getForegroundColor(),
          disabledBackgroundColor: _getBackgroundColor(),
          disabledForegroundColor: _getForegroundColor(),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: _getBorderSide(),
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w),
        ),
        child: Text(
          _getButtonText(),
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: _getForegroundColor(),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    switch (actionType) {
      case ProfileActionType.connection:
        return Colors.white;
      case ProfileActionType.edit:
        return AppTheme.editBackgroundColor;
      case ProfileActionType.currentlyUse:
        return AppTheme.currentlyUseBackgroundColor;
      case ProfileActionType.switchProfile:
        return AppTheme.primaryColor;
    }
  }

  Color _getForegroundColor() {
    switch (actionType) {
      case ProfileActionType.connection:
        return AppTheme.primaryColor;
      case ProfileActionType.edit:
        return AppTheme.primaryColor;
      case ProfileActionType.currentlyUse:
        return AppTheme.currentlyUseTextColor;
      case ProfileActionType.switchProfile:
        return Colors.white;
    }
  }

  BorderSide _getBorderSide() {
    switch (actionType) {
      case ProfileActionType.connection:
        return BorderSide(color: AppTheme.primaryColor);
      case ProfileActionType.edit:
        return BorderSide.none;
      case ProfileActionType.currentlyUse:
        return BorderSide.none;
      case ProfileActionType.switchProfile:
        return BorderSide.none;
    }
  }

  String _getButtonText() {
    switch (actionType) {
      case ProfileActionType.connection:
        return 'Connection';
      case ProfileActionType.edit:
        return 'Edit';
      case ProfileActionType.currentlyUse:
        return 'Currently use';
      case ProfileActionType.switchProfile:
        return 'Switch Profile';
    }
  }
}
