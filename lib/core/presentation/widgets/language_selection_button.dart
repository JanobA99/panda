import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class LanguageSelectionButton extends StatelessWidget {
  final String languageName;
  final bool isSelected;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  const LanguageSelectionButton({
    super.key,
    required this.languageName,
    this.isSelected = false,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.backgroundSecondary : AppColors.backgroundPrimary,
          foregroundColor: isSelected ? AppColors.buttonSecondary : AppColors.buttonPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(color: AppColors.buttonPrimary, width: isSelected ? 0 : 1),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
        ),
        child: Text(
          languageName,
          style: isSelected
              ? AppTextStyles.buttonPrimary.copyWith(fontWeight: FontWeight.w400)
              : AppTextStyles.buttonSecondary.copyWith(fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
