import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../domain/entities/user_profile.dart';

class StatusBadge extends StatelessWidget {
  final ProfileStatus status;

  const StatusBadge({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _getStatusColor().withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _getStatusText(),
            style: TextStyle(
              color: _getStatusColor(),
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            _getStatusIcon(),
            color: _getStatusColor(),
            size: 14,
          ),
        ],
      ),
    );
  }

  Color _getStatusColor() {
    switch (status) {
      case ProfileStatus.verified:
        return AppTheme.accentColor;
      case ProfileStatus.unverified:
        return AppTheme.errorColor;
      case ProfileStatus.pending:
        return AppTheme.pendingColor;
    }
  }

  String _getStatusText() {
    switch (status) {
      case ProfileStatus.verified:
        return 'Verified';
      case ProfileStatus.unverified:
        return 'unverified';
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
