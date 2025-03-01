import 'package:flutter/material.dart';

import '../../domain/entities/user_profile.dart';

/// Model class for [UserProfile] that extends the entity and adds
/// JSON serialization/deserialization capabilities.
///
/// This model is used for data transfer between the application and
/// external data sources (API, local storage, etc.).
class UserProfileModel extends UserProfile {
  /// Creates a new [UserProfileModel] with the same properties as [UserProfile].
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
    super.showBorder,
    super.borderColor,
  });

  /// Creates a [UserProfileModel] from a JSON map.
  ///
  /// This factory constructor converts a JSON map to a [UserProfileModel] instance,
  /// handling the conversion of primitive types to the appropriate model types.
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

  /// Converts this [UserProfileModel] to a JSON map.
  ///
  /// This method is used when sending data to external sources or
  /// when storing the model in local storage.
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

  /// Parses a string status to a [ProfileStatus] enum value.
  ///
  /// If the status string is not recognized, it defaults to [ProfileStatus.unverified].
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

  /// Converts a [ProfileStatus] enum value to its string representation.
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
