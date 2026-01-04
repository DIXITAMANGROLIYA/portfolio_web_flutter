import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_flutter/core/constants/portfolio_data.dart';
import 'package:portfolio_web_flutter/core/widgets/section_header.dart';
import 'package:portfolio_web_flutter/core/constants/app_color.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 80.h),
      width: double.infinity,
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Experience',
            subtitle: 'My professional journey and key achievements',
          ),
          
          // Timeline
          Column(
            children: PortfolioData.experiences.asMap().entries.map((entry) {
              final index = entry.key;
              final experience = entry.value;
              final isLast = index == PortfolioData.experiences.length - 1;
              
              return _ExperienceCard(
                experience: experience,
                isLast: isLast,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final Experience experience;
  final bool isLast;

  const _ExperienceCard({
    required this.experience,
    required this.isLast,
  });

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline
          Column(
            children: [
              Container(
                width: 16.w,
                height: 16.w,
                decoration: BoxDecoration(
                  color: _isHovered ? AppColors.accent : AppColors.accentSoft,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.accent,
                    width: 2,
                  ),
                ),
              ),
              if (!widget.isLast)
                Container(
                  width: 2.w,
                  height: 120.h,
                  color: AppColors.border,
                ),
            ],
          ),

          SizedBox(width: 24.w),

          // Content
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(bottom: widget.isLast ? 0 : 32.h),
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: AppColors.background,
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.experience.position,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.accent,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              widget.experience.company,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                            decoration: BoxDecoration(
                              color: AppColors.accentSoft,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Text(
                              widget.experience.duration,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 14.sp,
                                color: AppColors.textSecondary,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                widget.experience.location,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 16.h),

                  // Responsibilities
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.experience.responsibilities.map((responsibility) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 6.w,
                              height: 6.w,
                              margin: EdgeInsets.only(top: 8.h, right: 12.w),
                              decoration: BoxDecoration(
                                color: AppColors.accent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                responsibility,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  height: 1.5,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}