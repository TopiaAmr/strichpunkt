import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show Color, Colors;

/// Represents the verification status of a user profile.
///
/// Possible values:
/// - [verified]: The profile has been verified
/// - [unverified]: The profile has not been verified
/// - [pending]: The profile verification is in progress
enum ProfileStatus { verified, unverified, pending }

/// Entity representing a user profile in the application.
///
/// This entity contains all the information related to a user profile,
/// including personal information, status, and UI-related properties.
class UserProfile extends Equatable {
  /// Unique identifier for the user profile
  final String id;
  
  /// Full name of the user
  final String name;
  
  /// Social security/insurance number of the user
  final String svnNumber;
  
  /// Path to the user's avatar image
  final String avatarUrl;
  
  /// Relationship to the primary user (e.g., "Me", "My Father", "My Mother")
  final String relation;
  
  /// Verification status of the profile
  final ProfileStatus status;
  
  /// Number of connections associated with this profile
  final int connectCount;
  
  /// Number of medicines associated with this profile
  final int medicineCount;
  
  /// Number of consultations associated with this profile
  final int consultCount;
  
  /// Whether this profile is currently being used
  final bool isCurrentlyInUse;
  
  /// Whether to show a border around the profile avatar
  final bool showBorder;
  
  /// Color of the border around the profile avatar
  final Color borderColor;

  /// Creates a new [UserProfile] instance.
  ///
  /// All parameters except [showBorder] and [borderColor] are required.
  /// [showBorder] defaults to false and [borderColor] defaults to transparent.
  const UserProfile({
    required this.id,
    required this.name,
    required this.svnNumber,
    required this.avatarUrl,
    required this.relation,
    required this.status,
    required this.connectCount,
    required this.medicineCount,
    required this.consultCount,
    required this.isCurrentlyInUse,
    this.showBorder = false,
    this.borderColor = Colors.transparent,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    svnNumber,
    avatarUrl,
    relation,
    status,
    connectCount,
    medicineCount,
    consultCount,
    isCurrentlyInUse,
    showBorder,
    borderColor,
  ];
}
