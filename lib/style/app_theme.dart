import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/app_text_styles.dart';
import 'package:my_portfolio/style/app_colors.dart';
import 'package:my_portfolio/style/app_size.dart';

class AppTheme {
  static ThemeData get light {
    return _getThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        background: AppColors.grey[150]!,
        onBackground: AppColors.grey[900]!,
        surface: AppColors.grey[200]!,
        outline: AppColors.grey[300]!,
        outlineVariant: AppColors.grey[200]!,
        onSurface: AppColors.grey[800]!,
        onSurfaceVariant: AppColors.grey[700]!,
        tertiary: AppColors.grey[100]!,
      ),
      elevatedButtonTextStyle: _lightElevatedButtonTextStyle,
      outlineButtonTextStyle: _lightOutlinedButtonTextStyle,
      scaffoldBackgroundColor: AppColors.primaryColor,
      appbarTheme: AppBarTheme(color: AppColors.grey[500]!.withOpacity(.3)),
    );
  }

  static ThemeData get dark {
    return _getThemeData(
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryColor,
        background: AppColors.darkBackgroundColor,
        onBackground: AppColors.grey[100]!,
        // surface: AppColors.grey[850]!,
        outline: AppColors.grey[800]!,
        outlineVariant: AppColors.grey[700]!,
        onSurface: AppColors.grey[300]!,
        onSurfaceVariant: AppColors.grey[400]!,
        tertiary: AppColors.grey[900]!,
      ),
      elevatedButtonTextStyle: _darkElevatedButtonTextStyle,
      outlineButtonTextStyle: _darkOutlinedButtonTextStyle,
      scaffoldBackgroundColor: AppColors.darkBackgroundColor,
      appbarTheme: AppBarTheme(color: AppColors.grey[900]!.withOpacity(.3)),
    );
  }
}

ThemeData _getThemeData({
  required ColorScheme colorScheme,
  required WidgetStateProperty<TextStyle> elevatedButtonTextStyle,
  required WidgetStateProperty<TextStyle> outlineButtonTextStyle,
  required Color scaffoldBackgroundColor,
  required AppBarTheme appbarTheme,
}) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    primaryColor: colorScheme.primary,
    appBarTheme: appbarTheme,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: Insets.xs, vertical: 10),
        ),
        textStyle: elevatedButtonTextStyle,
      ),
    ),
    textTheme: GoogleFonts.meriendaTextTheme(),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(Size.fromHeight(40)),
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: Insets.xs, vertical: 10),
        ),
        textStyle: outlineButtonTextStyle,
      ),
    ),
  );
}

final _primaryButtonStates = WidgetStateProperty.resolveWith((states) {
  if (states.contains(WidgetState.hovered) ||
      states.contains(WidgetState.pressed)) {
    return BorderSide(color: Color(0xff561895).withOpacity(.7));
  }
});

final _outlineButtonStates = WidgetStateProperty.resolveWith((states) {
  if (states.contains(WidgetState.hovered) ||
      states.contains(WidgetState.pressed)) {
    return BorderSide(color: Color(0xff561895));
  }
});

WidgetStatePropertyAll<TextStyle> get _darkElevatedButtonTextStyle =>
    WidgetStatePropertyAll(
      TextStyle(fontWeight: FontWeight.w500, color: AppColors.grey[100]!),
    );
WidgetStatePropertyAll<TextStyle> get _lightElevatedButtonTextStyle =>
    WidgetStatePropertyAll(
      TextStyle(fontWeight: FontWeight.w500, color: AppColors.grey[100]!),
    );
WidgetStatePropertyAll<TextStyle> get _lightOutlinedButtonTextStyle =>
    WidgetStatePropertyAll(
      TextStyle(fontWeight: FontWeight.w500, color: AppColors.grey[800]!),
    );
WidgetStatePropertyAll<TextStyle> get _darkOutlinedButtonTextStyle =>
    WidgetStatePropertyAll(
      TextStyle(fontWeight: FontWeight.w500, color: AppColors.grey[100]!),
    );
