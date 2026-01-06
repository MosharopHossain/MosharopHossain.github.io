import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/home/presentation/home_page.dart';
import 'package:my_portfolio/style/app_theme.dart';
import 'package:my_portfolio/style/app_theme_controller.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeControllerProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.dark,
      themeMode: theme.value ?? ThemeMode.dark,
      home: Home(),
    );
  }
}
