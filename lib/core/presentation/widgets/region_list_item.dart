import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class RegionListItem extends StatelessWidget {
  final String regionName;
  final VoidCallback? onTap;
  final bool isSelected;

  const RegionListItem({
    super.key,
    required this.regionName,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.divider.withValues(alpha: 0.2),
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                regionName,
                style: AppTextStyles.bodyMedium,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.textPrimary,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
} 