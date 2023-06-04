import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/config/router/app_router.dart';
import 'package:wikipelis/config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('es', ''),
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const AppLocalizationDelegate().supportedLocales,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'WikiPelis',
      theme: AppTheme().getTheme(),
    );
  }
}
