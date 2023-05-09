import 'package:flutter/material.dart';
import 'package:wikipelis/config/router/app_router.dart';
import 'package:wikipelis/config/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: AppTheme().getTheme(),
    );
  }
}
