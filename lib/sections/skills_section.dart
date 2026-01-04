import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_flutter/core/constants/portfolio_data.dart';
import 'package:portfolio_web_flutter/core/widgets/section_header.dart';
import 'package:portfolio_web_flutter/core/widgets/skill_chip.dart';
import 'package:portfolio_web_flutter/core/constants/app_color.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
            title: 'Technical Skills',
            subtitle: 'Technologies and tools I work with',
          ),

          SizedBox(height: 32.h),

          // Skill Categories
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _SkillCategory(
                  title: 'Mobile Development',
                  icon: Icons.phone_android_outlined,
                  skills: ['Flutter', 'Dart', 'Android (Kotlin)'],
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: _SkillCategory(
                  title: 'Backend & APIs',
                  icon: Icons.api_outlined,
                  skills: ['REST API Integration', 'Firebase', 'WebSocket'],
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: _SkillCategory(
                  title: 'State Management',
                  icon: Icons.settings_outlined,
                  skills: ['Bloc', 'GetX', 'ValueNotifier'],
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: _SkillCategory(
                  title: 'Tools & Testing',
                  icon: Icons.build_outlined,
                  skills: ['GitHub', 'Postman', 'Jira'],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SkillCategory extends StatefulWidget {
  final String title;
  final IconData icon;
  final List<String> skills;

  const _SkillCategory({
    required this.title,
    required this.icon,
    required this.skills,
  });

  @override
  State<_SkillCategory> createState() => _SkillCategoryState();
}

class _SkillCategoryState extends State<_SkillCategory>
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
          color: _isHovered
              ? AppColors.accent.withValues(alpha: 0.05)
              : AppColors.background,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: _isHovered
                ? AppColors.accent.withValues(alpha: 0.3)
                : AppColors.border,
            width: 1.5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(
                    widget.icon,
                    color: AppColors.accent,
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // Skills
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.skills.map((skill) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.h),
                  child: Row(
                    children: [
                      Container(
                        width: 4.w,
                        height: 4.w,
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: Text(
                          skill,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.textSecondary),
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
    );
  }
}
