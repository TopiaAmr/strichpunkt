import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:strichpunkt/core/util/injection_container.dart';
import 'package:strichpunkt/features/user_profiles/presentation/cubits/get_user_profiles_cubit.dart';
import '../widgets/user_profile_widget.dart';

@RoutePage()
class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<GetUserProfilesCubit>()..getUserProfiles(),
      child: const UserProfileWidget(),
    );
  }
}
