import 'package:al_gamal_al_massi/core/app_theme/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/app_theme/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? elevation;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;
  final Widget? child;
  final String? text;
  final TextStyle? titleStyle;

  const CustomElevatedButton({
    super.key,
    this.backgroundColor = AppColors.primaryColor,
    this.foregroundColor,
    this.onPressed,
    this.child,
    this.text,
     this.borderRadius = 4,
    this.titleStyle,
    this.elevation,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        disabledBackgroundColor: AppColors.secondaryTextColor,
        backgroundColor: backgroundColor,
        elevation: elevation,
        padding: padding,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),
      child: child ??
          Text(
            text ?? "",
            style: titleStyle ??
                CustomThemes.whiteTextColorTextTheme(context).copyWith(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal
                ),
          ),
    );
  }
}
