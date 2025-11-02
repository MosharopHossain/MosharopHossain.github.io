import 'package:flutter/material.dart';
import 'package:my_portfolio/app_text_styles.dart';
import 'package:my_portfolio/style/app_colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      appBarTheme: AppBarTheme(color: AppColors.grey[900]),

      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        background: AppColors.secondary,
        onBackground: AppColors.grey[100]!,
      ),

      scaffoldBackgroundColor: AppColors.secondary
    );
  }

  static ThemeData get dark {
    return ThemeData(
      primaryColor: AppColors.primary,
      appBarTheme: AppBarTheme(color: AppColors.grey[900]),
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        background: AppColors.secondary,
        onBackground: AppColors.grey[100]!,
      ),
      scaffoldBackgroundColor: AppColors.secondary,
    );
  }
}