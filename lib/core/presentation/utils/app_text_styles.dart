import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Heading styles with different weights
  static TextStyle get h1 => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w900, // Black weight
    color: AppColors.textPrimary,
  );
  
  static TextStyle get h2 => TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800, // ExtraBold weight
    color: AppColors.textPrimary,
  );
  
  static TextStyle get h3 => TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700, // Bold weight
    color: AppColors.textPrimary,
  );
  
  static TextStyle get h4 => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600, // SemiBold weight
    color: AppColors.textPrimary,
  );
  
  // Body text styles with different weights
  static TextStyle get bodyLarge => TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500, // Medium weight
    color: AppColors.textPrimary,
  );
  
  static TextStyle get bodyMedium => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400, // Regular weight
    color: AppColors.textPrimary,
  );
  
  static TextStyle get bodySmall => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400, // Regular weight
    color: AppColors.textPrimary,
  );
  
  // Light text styles
  static TextStyle get bodyLight => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w300, // Light weight
    color: AppColors.textPrimary,
  );
  
  static TextStyle get bodyUltraLight => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w200, // UltraLight weight
    color: AppColors.textPrimary,
  );
  
  static TextStyle get bodyThin => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w100, // Thin weight
    color: AppColors.textPrimary,
  );
  
  // Caption and subtitle styles
  static TextStyle get caption => TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400, // Regular weight
    color: AppColors.textSecondary,
  );
  
  static TextStyle get subtitle => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400, // Regular weight
    color: AppColors.textSecondary,
  );
  
  // Button text styles
  static TextStyle get buttonPrimary => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600, // SemiBold weight
    color: AppColors.buttonSecondary,
  );
  
  static TextStyle get buttonSecondary => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600, // SemiBold weight
    color: AppColors.buttonPrimary,
  );
  
  // Special styles
  static TextStyle get appName => TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w900, // Black weight
    color: AppColors.textPrimary,
  );
  
  static TextStyle get searchHint => TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400, // Regular weight
    color: AppColors.textSecondary,
  );
  
  static TextStyle get sectionTitle => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700, // SemiBold weight
    color: AppColors.textPrimary,
  );
  
  // Additional weight variations
  static TextStyle get textBold => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700, // Bold weight
    color: AppColors.textPrimary,
  );
  
  static TextStyle get textExtraBold => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w800, // ExtraBold weight
    color: AppColors.textPrimary,
  );
  
  static TextStyle get textBlack => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w900, // Black weight
    color: AppColors.textPrimary,
  );
  
  static TextStyle get textHeavy => TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w900, // Heavy weight (same as Black)
    color: AppColors.textPrimary,
  );
} 