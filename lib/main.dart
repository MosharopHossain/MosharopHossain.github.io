import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_portfolio/home.dart';
import 'package:my_portfolio/l10n/app_localizations.dart';
import 'package:my_portfolio/style/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false
      ,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,

      supportedLocales: [
        const Locale('en'), // English, no country code
        const Locale('es'), // Spanish, no country code
        // Add other supported locales here
      ],
      home: Home()
    );
  }
}
