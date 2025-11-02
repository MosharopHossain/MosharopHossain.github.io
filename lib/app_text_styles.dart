import 'package:flutter/material.dart';

abstract class AppTextStyles {
  TextStyle get titleSmBold; 
  TextStyle get bodyMdMedium;
  TextStyle get titleLgBold; 
  TextStyle get bodySmRegular;
  TextStyle get bodyLgMedium;
  TextStyle get bodyLgBold;
}


class SmallTextStyles implements AppTextStyles {
  @override
  TextStyle get titleSmBold => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get bodyMdMedium => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get titleLgBold => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get bodySmRegular => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get bodyLgMedium => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get bodyLgBold => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );
}


class LargeTextStyles implements AppTextStyles {
  @override
  TextStyle get titleSmBold => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get bodyMdMedium => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get titleLgBold => const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      );

  @override
  TextStyle get bodySmRegular => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );

  @override
  TextStyle get bodyLgMedium => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      );

  @override
  TextStyle get bodyLgBold => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      );
}