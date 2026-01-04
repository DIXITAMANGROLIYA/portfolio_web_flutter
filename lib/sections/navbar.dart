import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:portfolio_web_flutter/core/constants/app_color.dart';
import 'package:portfolio_web_flutter/core/constants/portfolio_data.dart';
import 'package:portfolio_web_flutter/core/utills/app_utills.dart';

import 'main_layout.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<_NavItemData> _navItems = [
    _NavItemData('', SectionKeys.home),
    _NavItemData('About', SectionKeys.about),
    _NavItemData('Skills', SectionKeys.skills),
    _NavItemData('Experience', SectionKeys.experience),
    _NavItemData('Projects', SectionKeys.projects),
    _NavItemData('Education', SectionKeys.education),
    _NavItemData('Contact', SectionKeys.contact),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;
    
    return Container(
      height: 72.h,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.w : 80.w),
      decoration: BoxDecoration(
        color: AppColors.surface.withValues(alpha: 0.95),
        border: Border(bottom: BorderSide(color: AppColors.border, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Logo
          _Logo(),

          if (isMobile) ...[
            /// Mobile: Just show resume button
            ElevatedButton.icon(
              onPressed: () {
                AppUtils.launchExternalUrl('https://drive.google.com/file/d/1LrVeL9hbm3ACUph23ZErwDKafBavK9ke/view?usp=sharing');
              },
              icon: Icon(Icons.download_outlined, size: 14.sp),
              label: const Text('Resume'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                textStyle: TextStyle(fontSize: 12.sp),
              ),
            ),
          ] else ...[
            /// Desktop Navigation
            Row(
              children: [
                Row(
                  children: List.generate(_navItems.length, (index) {
                    final item = _navItems[index];
                    if ((item.title.isNotEmpty)) {
                      return _NavItem(
                        title: item.title,
                        isSelected: _selectedIndex == index,
                        onTap: () {
                          setState(() => _selectedIndex = index);
                          ScrollService.scrollTo(item.key);
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  }),
                ),
                SizedBox(width: 40.w),
                /// CTA
                ElevatedButton.icon(
                  onPressed: () {
                    AppUtils.launchExternalUrl('https://drive.google.com/file/d/1LrVeL9hbm3ACUph23ZErwDKafBavK9ke/view?usp=sharing');
                  },
                  icon: Icon(Icons.download_outlined, size: 16.sp),
                  label: const Text('Resume'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                   LOGO                                     */
/* -------------------------------------------------------------------------- */

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.accent,
                AppColors.accent.withValues(alpha: 0.7),
              ],
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: const Center(
            child: Text(
              'DM',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              PortfolioData.name.split(' ').first,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            Text(
              PortfolioData.title,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: AppColors.textSecondary),
            ),
          ],
        ),
      ],
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                               NAV ITEM                                     */
/* -------------------------------------------------------------------------- */

class _NavItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavItem({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool active = widget.isSelected || _isHovered;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: 6.w),
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: active
                ? AppColors.accent.withValues(alpha: 0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: widget.isSelected
                ? Border.all(color: AppColors.accent.withValues(alpha: 0.3))
                : null,
          ),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w500,
              color: widget.isSelected
                  ? AppColors.accent
                  : _isHovered
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                               DATA MODEL                                   */
/* -------------------------------------------------------------------------- */

class _NavItemData {
  final String title;
  final GlobalKey key;

  _NavItemData(this.title, this.key);
}
