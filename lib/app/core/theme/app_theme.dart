import 'package:flutter/material.dart';
import 'package:retroDownloader/app/core/theme/app_colors.dart';

class AppTheme {
  static TextTheme get text => theme.textTheme;
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      dividerColor: AppColors.grey[100],
      fontFamily: 'Roboto',
      primaryColor: AppColors.primary,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(AppColors.grey[300]),
        thickness: MaterialStateProperty.all(6),
        radius: const Radius.circular(8),
        crossAxisMargin: 0,
        mainAxisMargin: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(
          color: AppColors.grey[300],
          overflow: TextOverflow.clip,
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 57,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        displayMedium: TextStyle(
          fontSize: 45,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        displaySmall: TextStyle(
          fontSize: 36,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        headlineSmall: TextStyle(
          fontSize: 24,
          letterSpacing: 0,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          letterSpacing: 0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          letterSpacing: 0.15,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          letterSpacing: 0.0,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          letterSpacing: 0.1,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          letterSpacing: 0.3,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: 'Roboto',
          color: AppColors.grey,
        ),
      ),
    );
  }

  static BoxDecoration get boxDecorated => BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey[200]!, blurRadius: 4)],
      );

  static List<BoxShadow> shadow = [BoxShadow(color: Colors.grey[400]!, blurRadius: 2)];
}
