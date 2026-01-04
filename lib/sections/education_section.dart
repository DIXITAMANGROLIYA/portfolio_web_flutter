import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_flutter/core/constants/portfolio_data.dart';
import 'package:portfolio_web_flutter/core/widgets/section_header.dart';
import 'package:portfolio_web_flutter/core/constants/app_color.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.w : 80.w, 
        vertical: isMobile ? 60.h : 80.h
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Education',
            subtitle: 'My academic background and qualifications',
          ),
          
          isMobile 
            ? Column(
                children: PortfolioData.educations.map((education) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: _EducationCard(education: education),
                  );
                }).toList(),
              )
            : Row(
                children: PortfolioData.educations.asMap().entries.map((entry) {
                  final education = entry.value;
                  return Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: entry.key < PortfolioData.educations.length - 1 ? 24.w : 0,
                      ),
                      child: _EducationCard(education: education),
                    ),
                  );
                }).toList(),
              ),
        ],
      ),
    );
  }
}

class _EducationCard extends StatefulWidget {
  final Education education;

  const _EducationCard({required this.education});

  @override
  State<_EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<_EducationCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(isMobile ? 20.w : 24.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: _isHovered ? AppColors.accent.withValues(alpha: 0.3) : AppColors.border,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered 
                  ? AppColors.accent.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.02),
              blurRadius: _isHovered ? 12 : 4,
              offset: Offset(0, _isHovered ? 6 : 2),
            ),
          ],
        ),
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -4.0 : 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              padding: EdgeInsets.all(isMobile ? 10.w : 12.w),
              decoration: BoxDecoration(
                color: AppColors.accent.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                Icons.school_outlined,
                color: AppColors.accent,
                size: isMobile ? 20.sp : 24.sp,
              ),
            ),
            
            SizedBox(height: 16.h),
            
            // Degree
            Text(
              widget.education.degree,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: isMobile ? 16.sp : null,
                fontWeight: FontWeight.w600,
                color: AppColors.accent,
              ),
            ),
            
            SizedBox(height: 8.h),
            
            // Institution
            Text(
              widget.education.institution,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: isMobile ? 14.sp : null,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
            ),
            
            SizedBox(height: 12.h),
            
            // Duration and Location
            Row(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: isMobile ? 14.sp : 16.sp,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    widget.education.duration,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: isMobile ? 12.sp : null,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 8.h),
            
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: isMobile ? 14.sp : 16.sp,
                  color: AppColors.textSecondary,
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    widget.education.location,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: isMobile ? 12.sp : null,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}