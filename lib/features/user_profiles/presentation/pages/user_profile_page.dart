import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../widgets/user_profile_widget.dart';

@RoutePage()
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserProfileWidget();
  }
}
