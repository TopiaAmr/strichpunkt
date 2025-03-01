import 'package:flutter/material.dart';
import 'package:strichpunkt/core/util/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Strichpunkt',
      theme: AppTheme.themeData,
      routerConfig: _appRouter.config(),
    );
  }
}
