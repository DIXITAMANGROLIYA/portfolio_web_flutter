import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_flutter/core/constants/portfolio_data.dart';
import 'package:portfolio_web_flutter/core/widgets/section_header.dart';
import 'package:portfolio_web_flutter/core/widgets/animated_card.dart';
import 'package:portfolio_web_flutter/core/constants/app_color.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 80.w, vertical: 100.h),
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'About Me',
            subtitle: 'Professional background and technical expertise',
          ),

          SizedBox(height: 48.h),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// LEFT — ABOUT TEXT
              Expanded(
                flex: 3,
                child: AnimatedCard(
                  child: Padding(
                    padding: EdgeInsets.all(32.w),
                    child: Text(
                      PortfolioData.summary,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.7,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 40.w),

              /// TOOLS & LANGUAGES
              Expanded(
                flex: 1,
                child: AnimatedCard(
                  child: Padding(
                    padding: EdgeInsets.all(32.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tools & Languages',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.accent,
                          ),
                        ),
                        SizedBox(height: 24.h),

                        Wrap(
                          spacing: 14.w,
                          runSpacing: 14.h,
                          children: PortfolioData.languages.map((item) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 18.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.accentSoft,
                                borderRadius: BorderRadius.circular(24.r),
                                border: Border.all(color: AppColors.border),
                              ),
                              child: Text(
                                item,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              /// RIGHT — STATS GRID
             /* Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Expanded(
                          child: _StatCard(
                            icon: Icons.work_outline,
                            title: '2+',
                            subtitle: 'Years Experience',
                            color: AppColors.accent,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _StatCard(
                            icon: Icons.apps_outlined,
                            title: '10+',
                            subtitle: 'Projects',
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: const [
                        Expanded(
                          child: _StatCard(
                            icon: Icons.mobile_friendly,
                            title: '5+',
                            subtitle: 'Live Apps',
                            color: AppColors.accent,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: _StatCard(
                            icon: Icons.code,
                            title: '8+',
                            subtitle: 'Technologies',
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),*/
            ],
          ),

          SizedBox(height: 64.h),
        ],
      ),
    );
  }
}

class _StatCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: _isHovered ? widget.color.withValues(alpha: 0.1) : AppColors.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: _isHovered ? widget.color : AppColors.border,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered 
                  ? widget.color.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.02),
              blurRadius: _isHovered ? 8 : 4,
              offset: Offset(0, _isHovered ? 4 : 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                widget.icon,
                color: widget.color,
                size: 24.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: widget.color,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              widget.subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}