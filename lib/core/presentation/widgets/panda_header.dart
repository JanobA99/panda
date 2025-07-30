import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class PandaHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final Widget? trailing;

  const PandaHeader({
    super.key,
    required this.title,
    this.onBackPressed,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundPrimary,
        border: Border(
          bottom: BorderSide(
            color: AppColors.divider,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          if (onBackPressed != null)
            IconButton(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              onPressed: onBackPressed,
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.textPrimary,
                size: 24.sp,
              ),
            ),
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
} 