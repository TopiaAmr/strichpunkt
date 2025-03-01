import 'package:flutter/material.dart';

import '../../domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required super.id,
    required super.name,
    required super.svnNumber,
    required super.avatarUrl,
    required super.relation,
    required super.status,
    required super.connectCount,
    required super.medicineCount,
    required super.consultCount,
    required super.isCurrentlyInUse,
    required super.showBorder,
    required super.borderColor,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      name: json['name'],
      svnNumber: json['svnNumber'],
      avatarUrl: json['avatarUrl'],
      relation: json['relation'],
      status: _parseStatus(json['status']),
      connectCount: json['connectCount'],
      medicineCount: json['medicineCount'],
      consultCount: json['consultCount'],
      isCurrentlyInUse: json['isCurrentlyInUse'],
      showBorder: json['showBorder'],
      borderColor: Color(json['borderColor']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'svnNumber': svnNumber,
      'avatarUrl': avatarUrl,
      'relation': relation,
      'status': _statusToString(status),
      'connectCount': connectCount,
      'medicineCount': medicineCount,
      'consultCount': consultCount,
      'isCurrentlyInUse': isCurrentlyInUse,
      'showBorder': showBorder,
      'borderColor': borderColor,
    };
  }

  static ProfileStatus _parseStatus(String status) {
    switch (status) {
      case 'verified':
        return ProfileStatus.verified;
      case 'unverified':
        return ProfileStatus.unverified;
      case 'pending':
        return ProfileStatus.pending;
      default:
        return ProfileStatus.unverified;
    }
  }

  static String _statusToString(ProfileStatus status) {
    switch (status) {
      case ProfileStatus.verified:
        return 'verified';
      case ProfileStatus.unverified:
        return 'unverified';
      case ProfileStatus.pending:
        return 'pending';
    }
  }
}
