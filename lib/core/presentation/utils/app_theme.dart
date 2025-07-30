import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// AppTheme class provides centralized theme configuration for the app
class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Font family
  static const String fontFamily = 'Gilroy';

  // Colors - Using AppColors for consistency
  static const Color primaryColor = AppColors.primary;
  static const Color secondaryColor = AppColors.background;
  static const Color backgroundColor = AppColors.backgroundPrimary;
  static const Color errorColor = AppColors.error;
  static const Color successColor = AppColors.success;

  // Light Theme
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      textTheme: _buildTextTheme(),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      inputDecorationTheme: _buildInputDecorationTheme(),
      appBarTheme: _buildAppBarTheme(),
    );
  }

  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
      textTheme: _buildTextTheme(),
      elevatedButtonTheme: _buildElevatedButtonTheme(),
      inputDecorationTheme: _buildInputDecorationTheme(),
      appBarTheme: _buildAppBarTheme(),
    );
  }

  // Text Theme
  static TextTheme _buildTextTheme() {
    return TextTheme(
      displayLarge: AppTextStyles.h1.copyWith(fontFamily: fontFamily),
      displayMedium: AppTextStyles.h2.copyWith(fontFamily: fontFamily),
      displaySmall: AppTextStyles.h3.copyWith(fontFamily: fontFamily),
      headlineLarge: AppTextStyles.h4.copyWith(fontFamily: fontFamily),
      headlineMedium: AppTextStyles.h3.copyWith(fontFamily: fontFamily),
      headlineSmall: AppTextStyles.h4.copyWith(fontFamily: fontFamily),
      titleLarge: AppTextStyles.bodyLarge.copyWith(fontFamily: fontFamily),
      titleMedium: AppTextStyles.bodyMedium.copyWith(fontFamily: fontFamily),
      titleSmall: AppTextStyles.bodySmall.copyWith(fontFamily: fontFamily),
      bodyLarge: AppTextStyles.bodyLarge.copyWith(fontFamily: fontFamily),
      bodyMedium: AppTextStyles.bodyMedium.copyWith(fontFamily: fontFamily),
      bodySmall: AppTextStyles.bodySmall.copyWith(fontFamily: fontFamily),
      labelLarge: AppTextStyles.buttonPrimary.copyWith(fontFamily: fontFamily),
      labelMedium: AppTextStyles.caption.copyWith(fontFamily: fontFamily),
      labelSmall: AppTextStyles.caption.copyWith(fontSize: 10),
    );
  }

  // Elevated Button Theme
  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonPrimary,
        foregroundColor: AppColors.buttonSecondary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: AppTextStyles.buttonPrimary.copyWith(fontFamily: fontFamily),
      ),
    );
  }

  // Input Decoration Theme
  static InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.subtitle),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.subtitle),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColors.error),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      labelStyle: AppTextStyles.bodySmall.copyWith(fontFamily: fontFamily),
    );
  }

  // App Bar Theme
  static AppBarTheme _buildAppBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: AppTextStyles.h4.copyWith(fontFamily: fontFamily),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }
} 