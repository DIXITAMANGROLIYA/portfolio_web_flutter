import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_flutter/core/constants/app_color.dart';

class SkillChip extends StatefulWidget {
  final String label;
  final IconData? icon;

  const SkillChip({
    super.key,
    required this.label,
    this.icon,
  });

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.accent : AppColors.accentSoft,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: _isHovered ? AppColors.accent : AppColors.border,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.icon != null) ...[
              Icon(
                widget.icon,
                size: 16.sp,
                color: _isHovered ? Colors.white : AppColors.textPrimary,
              ),
              SizedBox(width: 6.w),
            ],
            Text(
              widget.label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: _isHovered ? Colors.white : AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}