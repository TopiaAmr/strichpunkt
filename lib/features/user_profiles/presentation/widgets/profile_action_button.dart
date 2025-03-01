import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';

enum ProfileActionType {
  connection,
  edit,
  currentlyUse,
  switchProfile,
}

class ProfileActionButton extends StatelessWidget {
  final ProfileActionType actionType;
  final VoidCallback onPressed;

  const ProfileActionButton({
    super.key,
    required this.actionType,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          foregroundColor: _getForegroundColor(),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: _getBorderSide(),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Text(
          _getButtonText(),
          style: TextStyle(
            fontSize: 14,
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
        return AppTheme.primaryColor.withAlpha(25);
      case ProfileActionType.currentlyUse:
        return AppTheme.accentColor.withAlpha(25);
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
        return AppTheme.accentColor;
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
