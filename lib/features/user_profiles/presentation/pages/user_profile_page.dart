import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_profile_bloc.dart';
import '../widgets/user_profile_widget.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: BlocProvider(
        create: (context) => UserProfileBloc(),
        child: const UserProfileWidget(),
      ),
    );
  }
}
