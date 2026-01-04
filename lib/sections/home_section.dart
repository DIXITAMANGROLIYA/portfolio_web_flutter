import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_flutter/core/constants/app_color.dart';
import 'package:portfolio_web_flutter/core/constants/portfolio_data.dart';
import 'package:portfolio_web_flutter/core/utills/app_utills.dart';
import 'package:portfolio_web_flutter/sections/main_layout.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.8, curve: Curves.easeOut),
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.2, 1.0, curve: Curves.easeOut),
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700.h,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.background,
            AppColors.background.withValues(alpha: 0.8),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background Pattern
          Positioned.fill(
            child: Image.asset('assets/hero-bg.jpg', fit: BoxFit.cover,),
          ),

          // blur
          Positioned.fill(
            child: Container(
              color: AppColors.border.withValues(alpha: 0.9), // bg-background/80 equivalent
            ),
          ),
          // Main Content
          Center(
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Profile Avatar
                        Container(
                          width: 120.w,
                          height: 120.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 2.r, color: AppColors.accentSoft),
                            gradient: LinearGradient(
                              colors: [
                                AppColors.accent,
                                AppColors.accent.withValues(alpha: 0.7),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.accent.withValues(alpha: 0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(100.r),
                              child: Image.asset('assets/profile_image.png')),
                        ),
                        SizedBox(height: 32.h),

                        // Name
                        Text(
                          PortfolioData.name,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: 48.sp,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: AppColors.accent,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.h),

                        // Title
                        Text(
                          PortfolioData.title1,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 8.h),

                        // Subtitle
                        Text(
                          PortfolioData.subtitle,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 32.h),

                        // Location
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 20.sp,
                              color: AppColors.accent,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              PortfolioData.location,
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.h),

                        // CTA Buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                AppUtils.launchExternalUrl('https://github.com/DIXITAMANGROLIYA');
                              },
                              icon: Icon(Icons.code, size: 18.sp),
                              label: Text('GitHub'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.w,
                                  vertical: 16.h,
                                ),
                              ),
                            ),
                            SizedBox(width: 16.w),
                            OutlinedButton.icon(
                              onPressed: () {
                                ScrollService.scrollTo(SectionKeys.contact);
                              },
                              icon: Icon(Icons.email_outlined, size: 18.sp, color: AppColors.accent,),
                              label: const Text('Get In Touch',style: TextStyle(color: AppColors.accent)),
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24.w,
                                  vertical: 16.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}