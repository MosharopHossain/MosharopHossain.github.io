import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/app_locale_controller.dart';
import 'package:my_portfolio/features/home/presentation/home_page.dart';
import 'package:my_portfolio/l10n/app_localizations.dart';

import 'package:my_portfolio/style/app_theme.dart';
import 'package:my_portfolio/style/app_theme_controller.dart';

void main() {
  runApp(ProviderScope(
    child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(appLocaleControllerProvider);
    final theme = ref.watch(appThemeControllerProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      darkTheme: AppTheme.dark,
      themeMode: theme.value ?? ThemeMode.dark,

      supportedLocales: [
        const Locale('en'), // English, no country code
        const Locale('es'), // Spanish, no country code
        // Add other supported locales here
      ],
      locale: Locale(locale.value ?? 'en'),
      home: Home(),
    );
  }
}
