import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_flutter/core/constants/app_color.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 4.w,
              height: isMobile ? 24.h : 32.h,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontSize: isMobile ? 24.sp : null,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          SizedBox(height: 8.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 14.sp : null,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
        SizedBox(height: isMobile ? 24.h : 32.h),
      ],
    );
  }
}