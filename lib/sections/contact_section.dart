import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_flutter/core/constants/portfolio_data.dart';
import 'package:portfolio_web_flutter/core/utills/app_utills.dart';
import 'package:portfolio_web_flutter/core/widgets/section_header.dart';
import 'package:portfolio_web_flutter/core/constants/app_color.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20.w : 80.w, 
        vertical: isMobile ? 60.h : 100.h
      ),
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            title: 'Get In Touch',
            subtitle: 'Open to opportunities and collaborations',
          ),

          SizedBox(height: 48.h),

          isMobile 
            ? Column(
                children: [
                  /// TEXT + CONTACT INFO
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's work together",
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.accent,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        'I am open to full-time, contract, and remote opportunities. '
                            'I have experience working directly with clients, understanding requirements, '
                            'and delivering production-ready mobile applications. '
                            'If you are looking for a reliable mobile application developer who can take ownership '
                            'and communicate clearly, feel free to reach out.',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontSize: 14.sp,
                          height: 1.7,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 32.h),

                      _ContactItem(
                        icon: Icons.work_outline,
                        title: 'LinkedIn',
                        subtitle: 'linkedin.com/in/dixitamangroliya12',
                        onTap: () {
                          AppUtils.launchExternalUrl('https://www.linkedin.com/in/dixitamangroliya12/');
                        },
                      ),
                    ],
                  ),

                  SizedBox(height: 32.h),

                  /// CTA CARD
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(24.w),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.accent,
                          AppColors.accent.withValues(alpha: 0.85),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available for Work',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Remote • Full-time • Contract',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 14.sp,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                        ),
                        SizedBox(height: 24.h),
                        ElevatedButton.icon(
                          onPressed: () {
                            AppUtils.openEmail(PortfolioData.email);
                          },
                          icon: Icon(Icons.email_outlined, size: 16.sp),
                          label: const Text('Contact Me'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.accent,
                            minimumSize: Size(double.infinity, 48.h),
                            padding: EdgeInsets.symmetric(
                              horizontal: 24.w,
                              vertical: 16.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// LEFT — TEXT + CONTACT INFO
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's work together",
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.accent,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'I am open to full-time, contract, and remote opportunities. '
                              'I have experience working directly with clients, understanding requirements, '
                              'and delivering production-ready mobile applications. '
                              'If you are looking for a reliable mobile application developer who can take ownership '
                              'and communicate clearly, feel free to reach out.',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            height: 1.7,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 40.h),

                        _ContactItem(
                          icon: Icons.work_outline,
                          title: 'LinkedIn',
                          subtitle: 'linkedin.com/in/dixitamangroliya12',
                          onTap: () {
                            AppUtils.launchExternalUrl('https://www.linkedin.com/in/dixitamangroliya12/');
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 64.w),

                  /// RIGHT — CTA CARD
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(32.w),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.accent,
                            AppColors.accent.withValues(alpha: 0.85),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(24.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Available for Work',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            'Remote • Full-time • Contract',
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.white.withValues(alpha: 0.9),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          ElevatedButton.icon(
                            onPressed: () {
                              AppUtils.openEmail(PortfolioData.email);
                            },
                            icon: Icon(Icons.email_outlined, size: 18.sp),
                            label: const Text('Contact Me'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.accent,
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 16.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
        ],
      ),
    );
  }
}

class _ContactItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  State<_ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<_ContactItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.all(isMobile ? 12.w : 16.w),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.accent.withValues(alpha: 0.05) : AppColors.background,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: _isHovered ? AppColors.accent.withValues(alpha: 0.3) : AppColors.border,
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(isMobile ? 10.w : 12.w),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Icon(
                  widget.icon,
                  color: AppColors.accent,
                  size: isMobile ? 18.sp : 20.sp,
                ),
              ),
              SizedBox(width: isMobile ? 12.w : 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: isMobile ? 16.sp : null,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      widget.subtitle,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isMobile ? 12.sp : null,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: isMobile ? 14.sp : 16.sp,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}