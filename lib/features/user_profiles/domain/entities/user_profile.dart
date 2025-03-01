import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show Color, Colors;

enum ProfileStatus { verified, unverified, pending }

class UserProfile extends Equatable {
  final String id;
  final String name;
  final String svnNumber;
  final String avatarUrl;
  final String relation;
  final ProfileStatus status;
  final int connectCount;
  final int medicineCount;
  final int consultCount;
  final bool isCurrentlyInUse;
  final bool showBorder;
  final Color borderColor;

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
