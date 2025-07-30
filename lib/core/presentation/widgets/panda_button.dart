import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

enum PandaButtonType {
  primary,    // Dark gray background with white text
  secondary,  // White background with dark gray border and text
  outline,    // White background with dark gray border
}

class PandaButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final PandaButtonType type;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool isLoading;

  const PandaButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = PandaButtonType.primary,
    this.width,
    this.height,
    this.padding,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 56.h,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: _getButtonStyle(),
        child: isLoading
            ? SizedBox(
                width: 20.w,
                height: 20.h,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.buttonSecondary),
                ),
              )
            : Text(
                text,
                style: _getTextStyle(),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    switch (type) {
      case PandaButtonType.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.backgroundSecondary,
          foregroundColor: AppColors.buttonSecondary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        );
      case PandaButtonType.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.backgroundPrimary,
          foregroundColor: AppColors.buttonPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: AppColors.buttonPrimary,
              width: 1.r,
            ),
          ),
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        );
      case PandaButtonType.outline:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.backgroundPrimary,
          foregroundColor: AppColors.buttonPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
            side: BorderSide(
              color: AppColors.buttonPrimary,
              width: 1.r,
            ),
          ),
          padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
        );
    }
  }

  TextStyle _getTextStyle() {
    switch (type) {
      case PandaButtonType.primary:
        return AppTextStyles.buttonPrimary;
      case PandaButtonType.secondary:
      case PandaButtonType.outline:
        return AppTextStyles.buttonSecondary.copyWith(fontWeight: FontWeight.w400);
    }
  }
} 