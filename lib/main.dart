import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wikipelis/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wikipelis/presentation/providers/theme/theme_provider.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(themeNotifierProvider);
    // chage with splashScreen
    if (theme.isDarkMode == null) return const SizedBox();
    return MaterialApp.router(
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
      theme: theme.getTheme(),
    );
  }
}
