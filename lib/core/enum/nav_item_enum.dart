import 'package:flutter/material.dart';

enum NavItem {
  medication,
  consult,
  add,
  profiles,
  more;

  String get title {
    switch (this) {
      case NavItem.medication:
        return 'Medication';
      case NavItem.consult:
        return 'Consult';
      case NavItem.add:
        return 'Add';
      case NavItem.profiles:
        return 'Profiles';
      case NavItem.more:
        return 'More';
    }
  }

  String get iconPath {
    switch (this) {
      case NavItem.medication:
        return 'assets/icons/medication.svg';
      case NavItem.consult:
        return 'assets/icons/consult.svg';
      case NavItem.add:
        return 'assets/icons/add.svg';
      case NavItem.profiles:
        return 'assets/icons/profiles.svg';
      case NavItem.more:
        return 'assets/icons/more.svg';
    }
  }

  IconData get fallbackIcon {
    switch (this) {
      case NavItem.medication:
        return Icons.medication_outlined;
      case NavItem.consult:
        return Icons.calendar_today_outlined;
      case NavItem.add:
        return Icons.add_circle_outline;
      case NavItem.profiles:
        return Icons.people_outline;
      case NavItem.more:
        return Icons.apps_outlined;
    }
  }
}
