import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_flutter/core/constants/portfolio_data.dart';
import 'package:portfolio_web_flutter/core/widgets/section_header.dart';
import 'package:portfolio_web_flutter/core/constants/app_color.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

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
            title: 'Featured Projects',
            subtitle: 'Some of the projects I\'ve worked on',
          ),
          
          Column(
            children: PortfolioData.projects.map((project) {
              return _ProjectCard(project: project);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final Project project;

  const _ProjectCard({required this.project});

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.only(bottom: 32.h),
        padding: EdgeInsets.all(isMobile ? 20.w : 32.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: _isHovered ? AppColors.accent.withValues(alpha: 0.3) : AppColors.border,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered 
                  ? AppColors.accent.withValues(alpha: 0.1)
                  : Colors.black.withValues(alpha: 0.02),
              blurRadius: _isHovered ? 16 : 8,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        transform: Matrix4.identity()
          ..translate(0.0, _isHovered ? -4.0 : 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            isMobile 
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Icon
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.accent,
                            AppColors.accent.withValues(alpha: 0.7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.mobile_friendly_outlined,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                    ),
                    
                    SizedBox(height: 16.h),
                    
                    // Project Info
                    Text(
                      widget.project.title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.accent,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      widget.project.subtitle,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.textSecondary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Project Icon
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.accent,
                            AppColors.accent.withValues(alpha: 0.7),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Icon(
                        Icons.mobile_friendly_outlined,
                        color: Colors.white,
                        size: 32.sp,
                      ),
                    ),
                    
                    SizedBox(width: 20.w),
                    
                    // Project Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.project.title,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.accent,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            widget.project.subtitle,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: AppColors.textSecondary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

            SizedBox(height: 20.h),

            // Technologies
            Wrap(
              spacing: isMobile ? 6.w : 8.w,
              runSpacing: isMobile ? 6.h : 8.h,
              children: widget.project.technologies.map((tech) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 10.w : 12.w, 
                    vertical: isMobile ? 4.h : 6.h
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.accentSoft,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: AppColors.accent.withValues(alpha: 0.2)),
                  ),
                  child: Text(
                    tech,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: isMobile ? 10.sp : null,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accent,
                    ),
                  ),
                );
              }).toList(),
            ),
            
            // Expandable Description
            AnimatedCrossFade(
              firstChild: Container(
                margin: EdgeInsets.only(top: 16.h),
                child: Text(
                  widget.project.description.first,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: isMobile ? 14.sp : null,
                    height: 1.6,
                    color: AppColors.textPrimary,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              secondChild: Container(
                margin: EdgeInsets.only(top: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Key Features & Achievements:',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: isMobile ? 16.sp : null,
                        fontWeight: FontWeight.w600,
                        color: AppColors.accent,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Column(
                      children: widget.project.description.map((desc) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
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
                                  desc,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    fontSize: isMobile ? 14.sp : null,
                                    height: 1.6,
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
              crossFadeState: _isExpanded 
                  ? CrossFadeState.showSecond 
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}
